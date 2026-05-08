<script setup lang="ts">
import CardHeader from './ui/cardheader.vue'

type ServiceItem = {
    title: string
    tagline: string
    iconType: 'home' | 'online' | 'shadow' | 'travel' | 'livein'
    /** Solid / gradient tile behind icon (reference: bright blue, purple, etc.) */
    iconWrap: string
}

const services: ServiceItem[] = [
    { title: 'Home Tutor', tagline: '1-on-1 at your pace', iconType: 'home', iconWrap: 'bg-gradient-to-br from-blue-500 to-blue-600 shadow-md shadow-blue-500/25' },
    { title: 'Online Tutor', tagline: 'Live classes anywhere', iconType: 'online', iconWrap: 'bg-gradient-to-br from-violet-500 to-indigo-600 shadow-md shadow-violet-500/25' },
    { title: 'Shadow Tutor', tagline: 'Extra focus & depth', iconType: 'shadow', iconWrap: 'bg-gradient-to-br from-blue-700 to-indigo-800 shadow-md shadow-indigo-600/25' },
    { title: 'Travel Tutor', tagline: 'Mentors at your location', iconType: 'travel', iconWrap: 'bg-gradient-to-br from-purple-500 to-violet-600 shadow-md shadow-purple-500/25' },
    { title: 'Live-In Tutor', tagline: 'Daily immersive coaching', iconType: 'livein', iconWrap: 'bg-gradient-to-br from-sky-400 to-blue-500 shadow-md shadow-sky-500/25' },
]

</script>

<template>
    <section id="services" class="relative mx-auto w-full max-w-[1200px] px-4 py-10  pb-8 sm:pb-10">
        <div aria-hidden="true" class="absolute left-1/2 top-5 -translate-x-1/2 h-24 w-screen bg-[#edf4ff] -z-10"></div>
        <div class="rounded-2xl" v-motion :initial="{ opacity: 0, y: 20 }"
            :visibleOnce="{ opacity: 1, y: 0, transition: { duration: 550, ease: 'easeOut', delay: 200 } }">

            <CardHeader class="mb-2" badge="What we offer" title="Tutoring formats designed around your life"
                description="Choose how your child learns — at home, online, or with dedicated mentor support across India." />

            <div class="grid grid-cols-2 gap-3 sm:grid-cols-3 sm:gap-4 lg:grid-cols-5">
                <a v-for="(service, i) in services" :key="service.title" href="#tutors"
                    class="group flex h-full min-h-[172px] flex-col items-center gap-2.5 rounded-2xl border border-[#e7eefb] bg-[#f6f8fd] px-3 py-4 text-center shadow-[0_2px_10px_rgba(37,99,235,0.05)] transition duration-200 hover:-translate-y-0.5 hover:border-blue-200/80 hover:bg-white sm:min-h-[190px] sm:px-4 sm:py-5"
                    v-motion :initial="{ opacity: 0, y: 10 }"
                    :visibleOnce="{ opacity: 1, y: 0, transition: { delay: 350 + i * 60, duration: 450 } }">
                    <span :class="[
                        'flex h-12 w-12 shrink-0 items-center justify-center rounded-xl ring-1 ring-white/30 transition group-hover:scale-105 sm:h-14 sm:w-14',
                        service.iconWrap,
                    ]">
                        <svg v-if="service.iconType === 'home'" class="h-8 w-8 text-white" viewBox="0 0 24 24"
                            fill="none" aria-hidden="true">
                            <path d="M4 10.5 12 4l8 6.5V20a1 1 0 0 1-1 1h-4.5v-6h-5v6H5a1 1 0 0 1-1-1v-9.5z"
                                stroke="currentColor" stroke-width="1.7" stroke-linecap="round"
                                stroke-linejoin="round" />
                        </svg>
                        <svg v-else-if="service.iconType === 'online'" class="h-8 w-8 text-white" viewBox="0 0 24 24"
                            fill="none" aria-hidden="true">
                            <circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.7" />
                            <path d="M3 12h18M12 3a15 15 0 0 1 0 18M12 3a15 15 0 0 0 0 18" stroke="currentColor"
                                stroke-width="1.4" stroke-linecap="round" />
                        </svg>
                        <svg v-else-if="service.iconType === 'shadow'" class="h-8 w-8 text-white" viewBox="0 0 24 24"
                            fill="none" aria-hidden="true">
                            <path d="M3.5 12s3.3-5.5 8.5-5.5S20.5 12 20.5 12s-3.3 5.5-8.5 5.5S3.5 12 3.5 12z"
                                stroke="currentColor" stroke-width="1.7" />
                            <circle cx="12" cy="12" r="2.7" fill="currentColor" />
                        </svg>
                        <svg v-else-if="service.iconType === 'travel'" class="h-8 w-8 text-white" viewBox="0 0 24 24"
                            fill="none" aria-hidden="true">
                            <rect x="4" y="6" width="16" height="12" rx="2.5" stroke="currentColor"
                                stroke-width="1.7" />
                            <path d="M8 10h8M8 13h5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                        </svg>
                        <svg v-else class="h-5 w-5 text-white" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                            <path d="M4 10.5 12 4l8 6.5V20a1 1 0 0 1-1 1h-4.5v-6h-5v6H5a1 1 0 0 1-1-1v-9.5z"
                                stroke="currentColor" stroke-width="1.7" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M12 10v4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                        </svg>
                    </span>
                    <div class="flex min-h-0 flex-1 flex-col items-center justify-center gap-1">
                        <p class="text-[13px] font-bold leading-tight text-blue-950 sm:text-[14px]">{{ service.title }}
                        </p>
                        <p class="text-[11px] leading-relaxed text-slate-500 sm:text-[12px]">{{ service.tagline }}</p>
                    </div>
                    <span
                        class="inline-flex items-center gap-1 text-[11px] font-semibold text-blue-600 transition-[gap] duration-200 group-hover:gap-1.5 sm:text-[12px]">
                        Know more
                        <span class="inline-flex h-5 w-5 items-center justify-center -ml-1">
                            <svg class="h-4 w-4 shrink-0" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                                <path d="M8 12h8" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
                                <path d="M13 7l5 5-5 5" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" />
                            </svg>
                        </span>
                    </span>
                </a>
            </div>

            <div class="mt-6 rounded-2xl bg-gradient-to-br from-blue-950 via-blue-700 to-indigo-900 px-5 py-5 shadow-[0_14px_40px_rgba(29,78,216,0.35)] ring-1 ring-white/10 sm:mt-8 sm:px-6 sm:py-6"
                v-motion :initial="{ opacity: 0, y: 12 }"
                :visibleOnce="{ opacity: 1, y: 0, transition: { delay: 520, duration: 450 } }">
                <div class="flex flex-col gap-4 sm:gap-5 lg:flex-row lg:items-center lg:justify-between">
                    <div>
                        <h3 class="font-display text-lg font-bold text-white sm:text-xl">
                            Ready to begin your learning journey?
                        </h3>
                        <p class="mt-1 text-sm text-blue-100/90">
                            Our counsellors will help you find the perfect mentor.
                        </p>
                    </div>

                    <div class="flex w-full flex-col gap-2 sm:w-auto sm:flex-row">
                        <a href="#book-demo"
                            class="inline-flex items-center justify-center rounded-lg bg-blue-500 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-blue-400">
                            Book Free Demo
                        </a>
                        <a href="#contact"
                            class="inline-flex items-center justify-center rounded-lg border border-blue-200/25 bg-white/10 px-5 py-2.5 text-sm font-semibold text-blue-100 transition hover:bg-white/15">
                            Talk to Counsellor
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>
