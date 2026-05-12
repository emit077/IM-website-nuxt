<script setup lang="ts">
import AboutSection from '~/components/AboutSection.vue'
import HeroSection from '~/components/HeroSection.vue'
import ServiceSection from '~/components/ServiceSection.vue'
import PartnersStrip from '~/components/PartnersStrip.vue'
import HireInstituteSection from '~/components/HireInstituteSection.vue'
import LearningStepsSection from '~/components/LearningStepsSection.vue'
import BrowseMentorsSection from '~/components/BrowseMentorsSection.vue'
import RegistrationCTASection from '~/components/RegistrationCTASection.vue'
import PartnerProgrammeSection from '~/components/PartnerProgrammeSection.vue'

useSeoMeta({
  title: 'Indian Mentors — Find the Perfect Tutor for Your Child',
  description:
    "India's #1 verified tutor platform. Connect with background-checked, subject-verified home and online tutors for Classes 1-12, JEE/NEET and college students.",
  ogTitle: 'Indian Mentors — Verified Tutors for Every Student',
  ogDescription:
    'Structured tutoring and reliable teacher recruitment — built for families and educators across India.',
  ogType: 'website',
})
</script>

<template>
  <div>
    <HeroSection />
    <PartnersStrip />
    <ServiceSection />
    <AboutSection />
    <LearningStepsSection />
    <BrowseMentorsSection />
    <PartnerProgrammeSection />
    <HireInstituteSection />
    <RegistrationCTASection />
  </div>
</template>
