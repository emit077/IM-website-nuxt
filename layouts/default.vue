<script setup lang="ts">
import AppNavbar from '~/components/AppNavbar.vue'
</script>

<template>
  <div class="flex flex-col min-h-screen">
    <AppNavbar />
    <main class="flex-1">
      <slot />
    </main>
    <footer class="border-t border-slate-200/70 bg-white/60 mt-10">
      <div class="container-page py-8 text-sm text-slate-500 flex flex-col sm:flex-row items-center justify-between gap-3">
        <p>© {{ new Date().getFullYear() }} Indian Mentors. Made in India.</p>
        <div class="flex items-center gap-5">
          <a href="#" class="hover:text-indigo-700 transition-colors">Privacy</a>
          <a href="#" class="hover:text-indigo-700 transition-colors">Terms</a>
          <a href="#" class="hover:text-indigo-700 transition-colors">Support</a>
        </div>
      </div>
    </footer>
  </div>
</template>
