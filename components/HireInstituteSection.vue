<script setup lang="ts">
const categories = [
  { title: 'Coaching Institutes', subtitle: 'Test-prep & centres', icon: 'book', tone: 'indigo' },
  { title: 'Schools', subtitle: 'K-12 programmes', icon: 'school', tone: 'sky' },
  { title: 'Colleges', subtitle: 'Higher education', icon: 'hat', tone: 'amber' },
  { title: 'EdTech Companies', subtitle: 'Product & content teams', icon: 'monitor', tone: 'emerald' },
  { title: 'Corporate Academic Programs', subtitle: 'L&D & upskilling', icon: 'building', tone: 'fuchsia' },
]

const metrics = [
  { value: '500K', suffix: '+', label: 'Verified Tutors' },
  { value: '100', suffix: '+', label: 'Institutions' },
  { value: '4.8', suffix: '/5', label: 'Satisfaction' },
  { value: '100', suffix: '%', label: 'Verified & Safe' },
]
</script>
<template>
  <section class="relative mx-auto w-full max-w-[1200px] px-4 py-8 sm:py-10" aria-label="Institute hiring section">
    <div
      class="relative overflow-hidden rounded-[28px] border border-indigo-300/35 bg-gradient-to-br from-indigo-900 via-indigo-700 to-indigo-500 px-5 py-6 text-white shadow-[0_24px_55px_-30px_rgba(37,99,235,0.85)] sm:px-7 sm:py-8 lg:px-8">
      <div aria-hidden="true" class="pointer-events-none absolute inset-0 opacity-[0.14]"
        style="background-image: linear-gradient(to right, rgba(255,255,255,.55) 1px, transparent 1px), linear-gradient(to bottom, rgba(255,255,255,.55) 1px, transparent 1px); background-size: 44px 44px;">
      </div>
      <div aria-hidden="true"
        class="pointer-events-none absolute -top-28 right-[-8%] h-[320px] w-[320px] rounded-full bg-white/10 blur-3xl">
      </div>
      <div aria-hidden="true"
        class="pointer-events-none absolute bottom-[-120px] left-[-40px] h-[260px] w-[260px] rounded-full bg-indigo-300/20 blur-3xl">
      </div>
      <div aria-hidden="true"
        class="pointer-events-none absolute right-10 top-14 h-[420px] w-[420px] rounded-full border border-white/15">
      </div>
      <div aria-hidden="true"
        class="pointer-events-none absolute right-28 top-28 h-[280px] w-[280px] rounded-full border border-white/10">
      </div>

      <div class="relative grid gap-6 lg:grid-cols-[1fr_320px] lg:items-start">
        <div>
          <span
            class="inline-flex rounded-md bg-white/15 px-3 py-1 text-[11px] font-bold uppercase tracking-[0.13em] text-indigo-100">
            Institutional Hiring
          </span>

          <h2 class="mt-3 text-[2.1rem] font-extrabold leading-[1.02] sm:text-[3rem]">
            Hire Verified Teachers
            <span class="block text-indigo-100">at Scale</span>
          </h2>

          <p class="mt-3 max-w-[68ch] text-[14px] leading-relaxed text-indigo-100/95 sm:text-[15px]">
            From single hires to bulk staffing, Indian Mentors' institutional division handles verified teacher
            sourcing,
            interview coordination, and contract management for educational organizations.
          </p>

          <div class="mt-6 grid grid-cols-1 gap-3 sm:grid-cols-2 lg:grid-cols-4">
            <div v-for="metric in metrics" :key="metric.label"
              class="relative border-l-[3px] border-indigo-200/90 bg-white/5 pl-4 py-2 transition duration-200 hover:bg-white/10">
              <div
                class="font-display font-extrabold text-[2rem] sm:text-[2.2rem] leading-none tracking-tight text-white">
                {{ metric.value }}<span class="text-indigo-200">{{ metric.suffix }}</span>
              </div>
              <p class="mt-2 text-[13px] leading-snug text-indigo-100/90 max-w-[16ch] font-semibold">
                {{ metric.label }}
              </p>
            </div>
          </div>

          <!-- <p class="mt-5 text-[12px] font-bold uppercase tracking-[0.12em] text-blue-100">We Hire For</p>
          <div class="mt-3 grid grid-cols-1 gap-2.5 sm:grid-cols-2">
            <div v-for="(item, i) in categories" :key="item.title" :class="[
              'flex items-center gap-2.5 rounded-xl border border-white/20 bg-white/95 px-3 py-2.5 shadow-[0_6px_18px_-15px_rgba(15,23,42,0.65)]',
              i === categories.length - 1 ? 'sm:col-span-2' : '',
            ]">
              <span :class="[
                'inline-flex h-8 w-8 shrink-0 items-center justify-center rounded-lg',
                item.tone === 'indigo' ? 'bg-indigo-50 text-indigo-600' : '',
                item.tone === 'sky' ? 'bg-sky-50 text-sky-600' : '',
                item.tone === 'amber' ? 'bg-amber-50 text-amber-600' : '',
                item.tone === 'emerald' ? 'bg-emerald-50 text-emerald-600' : '',
                item.tone === 'fuchsia' ? 'bg-fuchsia-50 text-fuchsia-600' : '',
              ]">
                <svg v-if="item.icon === 'book'" class="h-4 w-4" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                  <path d="M5 6.6A2.6 2.6 0 0 1 7.6 4H19v15.6H7.6A2.6 2.6 0 0 0 5 22V6.6Zm2-2.6v15.6"
                    stroke="currentColor" stroke-width="1.8" />
                </svg>
                <svg v-else-if="item.icon === 'school'" class="h-4 w-4" viewBox="0 0 24 24" fill="none"
                  aria-hidden="true">
                  <path d="m3 10 9-6 9 6M5 9.8V20h14V9.8M9 20v-5h6v5" stroke="currentColor" stroke-width="1.8"
                    stroke-linecap="round" stroke-linejoin="round" />
                </svg>
                <svg v-else-if="item.icon === 'hat'" class="h-4 w-4" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                  <path d="m3 9.8 9-4 9 4-9 4-9-4ZM6.8 11.8V16c0 1.7 2.3 3 5.2 3s5.2-1.3 5.2-3v-4.2"
                    stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
                <svg v-else-if="item.icon === 'monitor'" class="h-4 w-4" viewBox="0 0 24 24" fill="none"
                  aria-hidden="true">
                  <path d="M4 6h16v10H4zM9 20h6M12 16v4" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"
                    stroke-linejoin="round" />
                </svg>
                <svg v-else class="h-4 w-4" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                  <path d="M4 20h16M6 20V8h12v12M9 8V5h6v3M9 12h.01M12 12h.01M15 12h.01" stroke="currentColor"
                    stroke-width="1.8" stroke-linecap="round" />
                </svg>
              </span>
              <div>
                <p class="text-[14px] font-semibold leading-tight text-[#1f2f63]">{{ item.title }}</p>
                <p class="mt-0.5 text-[12px] leading-tight text-[#808aa8]">{{ item.subtitle }}</p>
              </div>
            </div>
          </div> -->

          <div class="mt-5 flex flex-col gap-2.5 sm:flex-row sm:items-center">
            <a href="#contact"
              class="group inline-flex h-12 items-center justify-center gap-2 rounded-xl bg-white px-7 text-[15px] font-semibold text-indigo-700 shadow-[0_14px_28px_-16px_rgba(15,23,42,0.65)] transition hover:bg-indigo-50">
              Hire Teachers
              <svg class="hiring-cta-arrow h-4 w-4 transition-transform group-hover:translate-x-0.5" viewBox="0 0 24 24"
                fill="none" aria-hidden="true">
                <path d="M5 12h14M13 6l6 6-6 6" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
              </svg>
            </a>
            <a href="#contact"
              class="inline-flex h-12 items-center justify-center gap-2 rounded-xl border border-white/40 bg-white/10 px-6 text-[15px] font-semibold text-white transition hover:bg-white/20">
              <svg class="h-4 w-4 text-white" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                <path
                  d="M12 2.8a9.2 9.2 0 1 0 9.2 9.2A9.2 9.2 0 0 0 12 2.8Zm4.1 6.7-5 5a1 1 0 0 1-1.4 0l-2.4-2.4a1 1 0 0 1 1.4-1.4l1.7 1.7 4.3-4.3a1 1 0 1 1 1.4 1.4Z"
                  fill="currentColor" />
              </svg>
              Talk to Recruiter
            </a>
          </div>
        </div>

        <aside
          class="rounded-2xl border border-white/20 bg-white/10 p-4 backdrop-blur-md shadow-[0_20px_45px_-30px_rgba(15,23,42,0.9)]"
          aria-label="Institutional hiring highlights">
          <p class="text-[14px] font-bold uppercase tracking-[0.13em] text-indigo-100/90">Hiring Workflow</p>
          <ol class="mt-3 space-y-6">
            <li class="flex items-start gap-2.5 rounded-xl border border-white/15 bg-white/10 p-2.5">
              <span
                class="mt-0.5 inline-grid h-5 w-5 place-items-center rounded-full bg-white text-[11px] font-bold text-indigo-700">1</span>
              <div>
                <p class="text-[16px] font-semibold text-white">Requirement Intake</p>
                <p class="text-[12px] text-white">Role mapping by subject, grade, and location.</p>
              </div>
            </li>
            <li class="flex items-start gap-2.5 rounded-xl border border-white/15 bg-white/10 p-2.5">
              <span
                class="mt-0.5 inline-grid h-5 w-5 place-items-center rounded-full bg-white text-[11px] font-bold text-indigo-700">2</span>
              <div>
                <p class="text-[16px] font-semibold text-white">Screening & Demo</p>
                <p class="text-[12px] text-white">Background checks, interviews, and trial classes.</p>
              </div>
            </li>
            <li class="flex items-start gap-2.5 rounded-xl border border-white/15 bg-white/10 p-2.5">
              <span
                class="mt-0.5 inline-grid h-5 w-5 place-items-center rounded-full bg-white text-[11px] font-bold text-indigo-700">3</span>
              <div>
                <p class="text-[16px] font-semibold text-white">Deployment Support</p>
                <p class="text-[12px] text-white">Onboarding, replacement, and quality follow-ups.</p>
              </div>
            </li>
          </ol>
        </aside>
      </div>
    </div>
  </section>
</template>

<style scoped>
.hiring-cta-arrow {
  animation: hiring-arrow-loop 0.95s ease-in-out infinite;
}

@keyframes hiring-arrow-loop {

  0%,
  100% {
    transform: translateX(0);
    opacity: 1;
  }

  50% {
    transform: translateX(4px);
    opacity: 0.7;
  }
}
</style>
