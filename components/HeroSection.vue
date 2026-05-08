<script setup lang="ts">
import TrustIndicators from './TrustIndicators.vue'
import HeroStats from './HeroStats.vue'
import IconArrowRight from './IconArrowRight.vue'
import IconBook from './IconBook.vue'
import IconCheck from './IconCheck.vue'

function rippleHandler(e: MouseEvent) {
  const target = e.currentTarget as HTMLElement
  const rect = target.getBoundingClientRect()
  target.style.setProperty('--x', `${e.clientX - rect.left}px`)
  target.style.setProperty('--y', `${e.clientY - rect.top}px`)
}
</script>

<template>
  <section class="relative overflow-hidden bg-cream-50" aria-labelledby="hero-heading">
    <!-- Animated mesh background -->
    <div aria-hidden="true" class="absolute inset-0 -z-10 bg-mesh-light"></div>
    <div aria-hidden="true" class="absolute inset-0 -z-10 opacity-[0.04]"
      style="background-image: radial-gradient(#1E293B 0.8px, transparent 0.8px); background-size: 24px 24px;"></div>

    <!-- Soft top fade -->
    <div aria-hidden="true"
      class="absolute -top-32 left-1/2 -translate-x-1/2 w-[1100px] h-[400px] bg-gradient-to-b from-indigo-200/30 to-transparent blur-3xl -z-10">
    </div>

    <div class="container-page pt-10 lg:pt-16 pb-12 ">
      <div class="grid grid-cols-1 lg:grid-cols-12 gap-10 lg:gap-12 items-start lg:items-stretch">
        <!-- LEFT: Content -->
        <div class="lg:col-span-7 xl:col-span-6 flex flex-col gap-7 lg:gap-8">
          <!-- Top Badge -->
          <div v-motion :initial="{ opacity: 0, y: -5 }"
            :enter="{ opacity: 1, y: 0, transition: { duration: 600, delay: 100 } }" class="self-start">
            <span class="badge-pill animate-float-slow">
              <span class="grid place-items-center w-5 h-5 rounded-full bg-emerald-500 text-white">
                <IconCheck class="w-3 h-3" />
              </span>
              <span>#1 India's Verified Tutor Platform</span>
              <span class="hidden sm:inline-block text-slate-300">•</span>
              <span class="hidden sm:inline-block text-emerald-700 font-semibold">2026</span>
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
              Book Free Demo
              <IconArrowRight class="w-4 h-4 transition-transform duration-300 group-hover:translate-x-1" />
            </a>
            <a href="#tutors" class="btn-secondary group w-full sm:w-auto">
              <span
                class="grid place-items-center w-6 h-6 rounded-full bg-blue-100 text-blue-700 transition-colors duration-200 group-hover:bg-blue-600 group-hover:text-white">
                <IconBook class="w-3.5 h-3.5" />
              </span>
              Browse Tutors
            </a>
          </div>



          <!-- Divider -->
          <div class="h-px bg-gradient-to-r from-transparent via-slate-200 to-transparent mt-2" v-motion
            :initial="{ opacity: 0 }" :enter="{ opacity: 1, transition: { delay: 1000, duration: 600 } }"></div>
        </div>

        <!-- RIGHT: Stats -->
        <div class="lg:col-span-5 xl:col-span-6 relative flex lg:self-stretch">
          <HeroStats />
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
