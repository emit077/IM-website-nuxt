#!/usr/bin/env bash
# Build the Nuxt static site and push it to a GitHub Pages branch.
#
# Usage (from repo root):
#   ./deploye.sh
#
# Environment (optional):
#   DEPLOY_BRANCH   — branch that GitHub Pages serves (default: gh-pages)
#   GIT_REMOTE      — remote name (default: origin)
#   NUXT_APP_BASE_URL — must match your Pages URL path, e.g. /indian-mentors/
#                       for https://<user>.github.io/indian-mentors/
#                       If unset, inferred from `git remote get-url origin`
#                       when it looks like github.com/<owner>/<repo>.git
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

DEPLOY_BRANCH="${DEPLOY_BRANCH:-gh-pages}"
GIT_REMOTE="${GIT_REMOTE:-origin}"

infer_base_url() {
  local url name
  url="$(git remote get-url "$GIT_REMOTE" 2>/dev/null || true)"
  [[ -z "$url" ]] && return 0
  # Normalize SSH and HTTPS GitHub URLs to owner/repo
  url="${url#git@github.com:}"
  url="${url#https://github.com/}"
  url="${url%.git}"
  [[ "$url" != */* ]] && return 0
  name="${url##*/}"
  # User/org site: <user>.github.io → site root is /
  if [[ "$name" == *.github.io ]]; then
    echo "/"
    return 0
  fi
  echo "/${name}/"
}

if [[ -z "${NUXT_APP_BASE_URL:-}" ]]; then
  NUXT_APP_BASE_URL="$(infer_base_url)"
fi
[[ -z "$NUXT_APP_BASE_URL" ]] && NUXT_APP_BASE_URL="/"
export NUXT_APP_BASE_URL

echo "Using NUXT_APP_BASE_URL=${NUXT_APP_BASE_URL} (override with env if wrong for your Pages URL)"
echo "Deploy branch: ${DEPLOY_BRANCH}, remote: ${GIT_REMOTE}"

if [[ ! -f package.json ]]; then
  echo "package.json not found; run this script from the project root." >&2
  exit 1
fi

REMOTE_URL="$(git -C "$ROOT" remote get-url "$GIT_REMOTE")"

npm ci
npm run generate

DIST="$ROOT/.output/public"
if [[ ! -d "$DIST" ]]; then
  echo "Expected build output at $DIST — generate failed?" >&2
  exit 1
fi

WORK="$(mktemp -d)"
cleanup() { rm -rf "$WORK"; }
trap cleanup EXIT

cp -a "${DIST}/." "${WORK}/"
cd "$WORK"

git init -q
git config user.email "deploy@local"
git config user.name "deploy script"
git add -A
if git diff --cached --quiet; then
  echo "No changes to publish."
  exit 0
fi

git commit -q -m "Deploy $(date -u +%Y-%m-%dT%H:%M:%SZ)"
git branch -M "$DEPLOY_BRANCH"
git remote add origin "$REMOTE_URL"
git push -f origin "$DEPLOY_BRANCH"

echo "Done. In the GitHub repo: Settings → Pages → Build and deployment → Branch → ${DEPLOY_BRANCH} / (root)."
