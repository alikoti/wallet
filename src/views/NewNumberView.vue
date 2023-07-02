<script setup>
import NewNumber from '../components/NewNumber.vue'
</script>

<template>
  <div class="about">
    <h1>Enter New Number To Be Added</h1>
  </div>
  <main>
    <NewNumber />
  </main>
</template>

<style>
@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>
