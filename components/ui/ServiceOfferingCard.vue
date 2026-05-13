<script setup lang="ts">
import { Icon } from '@iconify/vue'
import { computed } from 'vue'

const props = withDefaults(
  defineProps<{
    title: string
    description: string
    features: string[]
    href?: string
    iconSrc?: string
    iconMdi?: string
    span?: 2
    variant?: 'surface' | 'primary'
    accent?: {
      checkCircle: string
      link: string
      iconTint: string
      headingBar?: string
      iconMdiClass?: string
    }
  }>(),
  {
    href: '#tutors',
    variant: 'surface',
    accent: () => ({
      checkCircle: 'bg-blue-600 text-white',
      link: 'text-blue-600 group-hover:text-blue-700',
      iconTint: 'bg-blue-50 ring-1 ring-blue-100/90',
      headingBar: 'bg-blue-600',
      iconMdiClass: 'text-slate-600',
    }),
  },
)

const isPrimary = computed(() => props.variant === 'primary')

const rootClass = computed(() => {
  const base = isPrimary.value
    ? [
      'group relative flex min-h-[320px] min-w-0 flex-col rounded-2xl border border-white/15 bg-gradient-to-br from-blue-700 via-blue-600 to-indigo-800 p-4 text-center shadow-[0_12px_40px_-12px_rgba(29,78,216,0.45)] ring-1 ring-white/10 transition duration-300',
      'hover:-translate-y-1 hover:shadow-[0_20px_50px_-12px_rgba(29,78,216,0.55)] hover:brightness-[1.02]',
      'sm:min-h-0 sm:p-5',
    ]
    : [
      'group relative flex min-h-[320px] min-w-0 flex-col rounded-2xl border border-slate-200/80 bg-white p-4 text-center shadow-[0_4px_24px_rgba(15,23,42,0.06)] transition duration-300',
      'hover:-translate-y-1 hover:border-slate-300/90 hover:shadow-[0_12px_40px_rgba(15,23,42,0.1)] sm:min-h-0 sm:p-4',
    ]
  const wide = props.span === 2 ? 'lg:flex-row lg:items-stretch lg:gap-6 lg:text-left xl:gap-8 xl:p-6' : ''
  return [base.join(' '), wide].filter(Boolean).join(' ')
})

const iconWrapClass = computed(() => {
  if (isPrimary.value) {
    return 'flex h-[4.5rem] w-[4.5rem] items-center justify-center rounded-full bg-white/15 ring-1 ring-white/25 backdrop-blur-sm'
  }
  return ['flex h-[4.5rem] w-[4.5rem] items-center justify-center rounded-full', props.accent?.iconTint ?? ''].join(' ')
})

const titleClass = computed(() =>
  isPrimary.value
    ? 'font-display text-base font-bold text-white sm:text-lg'
    : 'font-display text-base font-bold text-slate-900 sm:text-lg',
)

const barClass = computed(() =>
  isPrimary.value
    ? 'block h-0.5 w-10 rounded-full bg-amber-400/90 mx-auto my-2'
    : ['block rounded-full w-10 h-0.5 mx-auto my-2', props.accent?.headingBar ?? 'bg-blue-600'].join(' '),
)

const descClass = computed(() =>
  isPrimary.value
    ? 'mt-2 flex-1 text-sm leading-relaxed text-blue-50/95'
    : 'mt-2 flex-1 text-sm leading-relaxed text-slate-600',
)

const dividerClass = computed(() =>
  isPrimary.value
    ? 'block h-px w-full rounded-full bg-white/20 mx-auto my-2 mt-3'
    : 'block bg-gray-200 rounded-full w-full h-0.5 mx-auto my-2 mt-3',
)

const featureTextClass = computed(() =>
  isPrimary.value ? 'text-[14px] leading-snug text-white/95' : 'text-[14px] leading-snug text-slate-700',
)

const checkClass = computed(() =>
  isPrimary.value
    ? 'mt-[0.12em] grid size-[1.35em] min-h-[1.25rem] min-w-[1.25rem] shrink-0 place-items-center rounded-full bg-white text-blue-700 shadow-sm'
    : ['mt-[0.12em] grid size-[1.35em] min-h-[1.25rem] min-w-[1.25rem] shrink-0 place-items-center rounded-full text-white', props.accent?.checkCircle ?? ''].join(' '),
)

const linkClass = computed(() =>
  isPrimary.value
    ? 'mt-4 inline-flex items-center justify-center gap-1 text-sm font-semibold text-white transition-[gap] duration-200 group-hover:gap-2 hover:text-amber-200'
    : ['mt-4 inline-flex items-center justify-center gap-1 text-sm font-semibold transition-[gap] duration-200 group-hover:gap-2', props.accent?.link ?? ''].join(' '),
)

const iconMdiClass = computed(() => (isPrimary.value ? 'text-white' : props.accent?.iconMdiClass ?? 'text-slate-600'))
</script>

<template>
  <a :href="href" :class="rootClass">
    <div
      :class="['mb-4 flex justify-center pt-1', span === 2 && 'lg:mb-0 lg:shrink-0 lg:justify-start lg:self-center']">
      <span :class="iconWrapClass" v-if="iconMdi || iconSrc">
        <Icon v-if="iconMdi" :icon="iconMdi" :class="['h-8 w-8 sm:h-9 sm:w-9', iconMdiClass]" aria-hidden="true" />
        <img v-else-if="iconSrc" :src="iconSrc" :alt="`${title} service`" width="30" height="30"
          :class="['h-8 w-8 object-contain', isPrimary && 'brightness-0 invert']" loading="lazy" />
      </span>
    </div>

    <div :class="span === 2 ? 'flex min-h-0 flex-1 flex-col lg:min-w-0' : 'contents'">
      <h3 :class="[titleClass, span === 2 && 'text-center lg:text-left']">
        {{ title }}
      </h3>
      <span :class="[barClass, span === 2 && 'lg:mx-0']" />
      <p :class="[descClass, span === 2 && 'text-center lg:text-left']">
        {{ description }}
      </p>
      <span :class="[dividerClass, span === 2 && 'lg:mx-0']" />
      <div class="mt-4">
        <ul class="space-y-2.5 text-left" :class="featureTextClass">
          <li v-for="feat in features" :key="feat" class="flex items-start gap-2">
            <span :class="checkClass" aria-hidden="true">
              <Icon icon="mdi:check"
                :class="isPrimary ? 'size-[1.08em] min-h-3.5 min-w-3.5 text-blue-700' : 'size-[1.08em] min-h-3.5 min-w-3.5 text-white'" />
            </span>
            <span>{{ feat }}</span>
          </li>
        </ul>
      </div>

      <span :class="[linkClass, span === 2 && 'lg:justify-start']">
        Know more
        <svg class="h-4 w-4 shrink-0 transition-transform duration-200 group-hover:translate-x-0.5" viewBox="0 0 24 24"
          fill="none" aria-hidden="true">
          <path d="M8 12h8" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          <path d="M13 7l5 5-5 5" stroke="currentColor" stroke-width="2" stroke-linecap="round"
            stroke-linejoin="round" />
        </svg>
      </span>
    </div>
  </a>
</template>
