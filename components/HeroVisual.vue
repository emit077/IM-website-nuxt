<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import FloatingCard from './FloatingCard.vue'
import IconShield from './IconShield.vue'
import IconStar from './IconStar.vue'
import IconUsers from './IconUsers.vue'
import IconHome from './IconHome.vue'

// Subtle pointer-driven parallax for premium feel
const visualRef = ref<HTMLElement | null>(null)
const parallax = ref({ x: 0, y: 0 })

function onPointerMove(e: PointerEvent) {
  const el = visualRef.value
  if (!el) return
  const rect = el.getBoundingClientRect()
  const cx = rect.left + rect.width / 2
  const cy = rect.top + rect.height / 2
  // normalize to roughly -1..1
  const nx = (e.clientX - cx) / rect.width
  const ny = (e.clientY - cy) / rect.height
  parallax.value = { x: nx * 8, y: ny * 8 }
}
function onPointerLeave() {
  parallax.value = { x: 0, y: 0 }
}

onMounted(() => {
  if (typeof window !== 'undefined' && window.matchMedia('(hover: hover)').matches) {
    visualRef.value?.addEventListener('pointermove', onPointerMove)
    visualRef.value?.addEventListener('pointerleave', onPointerLeave)
  }
})
onUnmounted(() => {
  visualRef.value?.removeEventListener('pointermove', onPointerMove)
  visualRef.value?.removeEventListener('pointerleave', onPointerLeave)
})

// Use a high-quality external image (lazy, lcp candidate)
const studentImage =
  'https://images.unsplash.com/photo-1571260899304-425eee4c7efc?auto=format&fit=crop&w=1200&q=85'
</script>

<template>
  <div ref="visualRef" class="relative w-full h-full min-h-[520px] lg:min-h-[640px] flex items-center justify-center">
    <!-- Animated mesh background blobs -->
    <div aria-hidden="true" class="absolute inset-0 -z-10 overflow-hidden">
      <div class="mesh-blob bg-indigo-300/50 w-[420px] h-[420px] -top-20 -right-10 animate-float-slow"></div>
      <div class="mesh-blob bg-emerald-300/40 w-[320px] h-[320px] bottom-0 -left-10 animate-float"
        style="animation-delay: -2s"></div>
      <div class="mesh-blob bg-amber-300/40 w-[260px] h-[260px] top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
      </div>
    </div>

    <!-- Soft radial glow behind student -->
    <div aria-hidden="true" class="absolute inset-0 -z-10 grid place-items-center">
      <div class="w-[78%] h-[78%] rounded-full bg-indigo-200/40 blur-3xl"></div>
    </div>

    <!-- Main image card with parallax -->
    <div class="relative aspect-[4/5] w-[88%] max-w-[460px] sm:max-w-[500px]" :style="{
      transform: `translate3d(${parallax.x}px, ${parallax.y}px, 0)`,
      transition: 'transform 220ms cubic-bezier(0.22, 1, 0.36, 1)',
    }" v-motion :initial="{ opacity: 0, scale: 0.94, y: 30 }" :enter="{
        opacity: 1,
        scale: 1,
        y: 0,
        transition: { duration: 900, delay: 200, ease: [0.22, 1, 0.36, 1] },
      }">
      <!-- Decorative gradient ring -->
      <div aria-hidden="true"
        class="absolute -inset-3 rounded-[2.2rem] bg-gradient-to-br from-indigo-400/30 via-emerald-300/20 to-amber-300/30 blur-2xl">
      </div>

      <div class="relative w-full h-full rounded-[2rem] overflow-hidden shadow-card border border-white/60 bg-white">
        <NuxtImg :src="studentImage" alt="Smiling Indian student holding textbooks, ready to learn with Indian Mentors"
          class="w-full h-full object-cover" width="900" height="1125" format="webp" loading="eager"
          fetchpriority="high" placeholder sizes="(max-width: 640px) 88vw, (max-width: 1024px) 45vw, 480px" />

        <!-- Subtle gradient overlay for depth -->
        <div aria-hidden="true"
          class="absolute inset-0 bg-gradient-to-t from-indigo-900/15 via-transparent to-transparent"></div>
      </div>
    </div>

    <!-- Floating Card: Verified Tutor (top-left) -->
    <FloatingCard variant="success" :delay="600" float="normal" :initial-x="-20" :initial-y="-10"
      class="absolute top-6 left-2 sm:left-0 lg:-left-6 w-[220px]">
      <template #icon-svg>
        <IconShield class="w-5 h-5" />
      </template>
      <template #label>Verified Tutor</template>
      <template #value>Background Cleared</template>
    </FloatingCard>

    <!-- Floating Card: 4.9 Rating (top-right) -->
    <FloatingCard variant="warning" :delay="850" float="slow" :initial-x="20" :initial-y="-10"
      class="absolute top-24 right-2 sm:right-0 lg:-right-4 w-[178px]">
      <template #icon-svg>
        <IconStar class="w-5 h-5" />
      </template>
      <template #label>Parent Rating</template>
      <template #value>4.9 / 5.0</template>
    </FloatingCard>

    <!-- Floating Card: 5000+ Tutors (bottom-left) -->
    <FloatingCard variant="primary" :delay="1100" float="slow" :initial-x="-20" :initial-y="10"
      class="absolute bottom-20 left-2 sm:-left-2 lg:-left-8 w-[210px]">
      <template #icon-svg>
        <IconUsers class="w-5 h-5" />
      </template>
      <template #label>Tutor Network</template>
      <template #value>5,000+ Mentors</template>
    </FloatingCard>

    <!-- Floating Card: Online + Home (bottom-right) -->
    <FloatingCard variant="success" :delay="1300" float="normal" :initial-x="20" :initial-y="10"
      class="absolute bottom-6 right-2 sm:-right-2 lg:-right-2 w-[228px]">
      <template #icon-svg>
        <IconHome class="w-5 h-5" />
      </template>
      <template #label>Modes Available</template>
      <template #value>Online + Home</template>
    </FloatingCard>

    <!-- Tiny pulsing live dot -->
    <div aria-hidden="true" class="absolute top-1/2 -right-1 sm:right-2 lg:right-8 w-3 h-3" v-motion
      :initial="{ opacity: 0, scale: 0 }" :enter="{ opacity: 1, scale: 1, transition: { delay: 1500, duration: 400 } }">
      <span class="absolute inset-0 rounded-full bg-emerald-400 animate-pulse-ring"></span>
      <span class="absolute inset-0 rounded-full bg-emerald-500 ring-4 ring-white"></span>
    </div>
  </div>
</template>
