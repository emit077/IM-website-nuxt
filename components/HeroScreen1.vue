<script setup lang="ts">
import TrustIndicators from './TrustIndicators.vue'
import HeroVisual from './HeroVisual.vue'
import IconArrowRight from './IconArrowRight.vue'
import IconBook from './IconBook.vue'
import IconCalendar from './IconCalendar.vue'
import IconCheck from './IconCheck.vue'

function rippleHandler(e: MouseEvent) {
  const target = e.currentTarget as HTMLElement
  const rect = target.getBoundingClientRect()
  target.style.setProperty('--x', `${e.clientX - rect.left}px`)
  target.style.setProperty('--y', `${e.clientY - rect.top}px`)
}
const reviewerAvatars = [
  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=120&q=80',
  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=120&q=80',
  'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=120&q=80',
  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=120&q=80',
]
</script>

<template>
  <section class="relative overflow-hidden bg-cream-50" aria-labelledby="hero-heading">
    <!-- Animated mesh background -->
    <div aria-hidden="true" class="absolute inset-0 -z-10 bg-mesh-light"></div>
    <div aria-hidden="true" class="absolute inset-0 -z-10 opacity-[0.04]"
      style="background-image: radial-gradient(#1E293B 0.8px, transparent 0.8px); background-size: 24px 24px;"></div>
    <!-- Subtle decorative blobs -->
    <div aria-hidden="true"
      class="absolute -top-20 -left-14 w-72 h-72 rounded-full bg-indigo-300/25 blur-3xl -z-10 pointer-events-none">
    </div>
    <div aria-hidden="true"
      class="absolute top-28 -right-20 w-80 h-80 rounded-full bg-sky-300/20 blur-3xl -z-10 pointer-events-none"></div>
    <div aria-hidden="true"
      class="absolute bottom-12 right-[18%] w-44 h-44 rounded-full border border-indigo-200/70 bg-white/25 backdrop-blur-[1px] -z-10 pointer-events-none">
    </div>

    <!-- Soft top fade -->
    <div aria-hidden="true"
      class="absolute -top-32 left-1/2 -translate-x-1/2 w-[1100px] h-[400px] bg-gradient-to-b from-indigo-200/30 to-transparent blur-3xl -z-10">
    </div>

    <div class="container-page pt-10 lg:pt-16 pb-12 ">
      <div class="grid grid-cols-1 lg:grid-cols-12 gap-10 lg:gap-12 items-start lg:items-stretch">
        <!-- LEFT: Content -->
        <div class="lg:col-span-7 xl:col-span-6 flex flex-col gap-7 lg:gap-8">
          <!-- Top Badge -->
          <div>
            <span class="badge-pill">
              <span class="grid place-items-center w-5 h-5 rounded-full bg-emerald-500 text-white">
                <IconCheck class="w-3 h-3" />
              </span>
              <span>#1 India's Verified Tutor Platform</span>
            </span>
          </div>

          <!-- Headline -->
          <h1 id="hero-heading"
            class="heading-display text-balance text-[2.4rem] sm:text-5xl lg:text-[3.7rem] xl:text-[4rem] leading-[1.06]"
            v-motion :initial="{ opacity: 0, y: 24 }"
            :enter="{ opacity: 1, y: 0, transition: { duration: 700, delay: 200, ease: [0.22, 1, 0.36, 1] } }">
            Find the
            <span class="text-gradient-brand">Perfect Tutor</span>
            <br class="hidden sm:block" />
            for Your Child
          </h1>

          <!-- Supporting text -->
          <p class="text-pretty text-base sm:text-lg text-slate-600 max-w-xl leading-relaxed" v-motion
            :initial="{ opacity: 0, y: 16 }" :enter="{ opacity: 1, y: 0, transition: { duration: 700, delay: 350 } }">
            Structured tutoring and reliable teacher recruitment — built for families
            and educators across India. Background-checked mentors. Personalised plans.
            Real progress.
          </p>

          <!-- CTAs -->
          <div class="flex flex-col sm:flex-row gap-3 sm:gap-4" v-motion :initial="{ opacity: 0, y: 16 }"
            :enter="{ opacity: 1, y: 0, transition: { duration: 600, delay: 500 } }">
            <a href="#book-demo" class="btn-primary ripple group w-full sm:w-auto" @mousemove="rippleHandler">
              <IconCalendar class="w-4 h-4 shrink-0 opacity-95" />
              Book Free Demo
              <IconArrowRight
                class="hero-cta-arrow w-4 h-4 transition-transform duration-300 group-hover:translate-x-1" />
            </a>
            <a href="#tutors" class="btn-secondary group w-full sm:w-auto">
              <span
                class="grid place-items-center w-6 h-6 rounded-full bg-blue-100 text-blue-700 transition-colors duration-200 group-hover:bg-blue-600 group-hover:text-white">
                <IconBook class="w-3.5 h-3.5" />
              </span>
              Browse Tutors
            </a>
          </div>
          <!-- Reviewer Avatars -->
          <div class="sm:col-span-2 w-full  items-center justify-between px-4 py-3">
            <div class="flex -space-x-2">
              <img v-for="(avatar, i) in reviewerAvatars" :key="`reviewer-${i}`" :src="avatar"
                :alt="`Parent reviewer ${i + 1}`" class="w-8 h-8 rounded-full border-2 border-white object-cover"
                loading="lazy" />
            </div>
            <div class="text-sm leading-tight">
              <div class="text-amber-500 tracking-[1px]">★★★★★</div>
              <p class="text-slate-700">
                Rated <span class="font-semibold text-slate-900">4.9</span> by
                <span class="font-semibold text-slate-900">14k+</span> parents
              </p>
            </div>
          </div>

          <!-- Divider -->
          <div class="h-px bg-gradient-to-r from-transparent via-slate-200 to-transparent mt-2" v-motion
            :initial="{ opacity: 0 }" :enter="{ opacity: 1, transition: { delay: 1000, duration: 600 } }"></div>
        </div>

        <!-- RIGHT: Visual + floating trust cards -->
        <div class="relative flex min-h-0 lg:col-span-5 xl:col-span-6 lg:self-stretch">
          <HeroVisual class="w-full" image-src="/img/hero/hero1.png" />
        </div>
      </div>
      <!-- Trust Indicators -->
      <TrustIndicators class="pt-1" />
    </div>

    <!-- Bottom soft fade into next section -->
    <div aria-hidden="true"
      class="absolute bottom-0 left-0 right-0 h-24 bg-gradient-to-b from-transparent to-cream-50 pointer-events-none">
    </div>
  </section>
</template>

<style scoped>
.hero-cta-arrow {
  animation: hero-arrow-loop 0.95s ease-in-out infinite;
}

@keyframes hero-arrow-loop {

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
