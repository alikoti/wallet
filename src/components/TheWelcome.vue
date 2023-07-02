<template>
  <div>
    <form @submit.prevent="submitForm">
      <label for="extension">Extension Number:</label>
      <input type="number" id="extension" v-model="extensionNumber" required>
      
      <label for="secret">Secret:</label>
      <input type="password" id="secret" v-model="secret" required>
      
      <label for="callerid">Caller ID:</label>
      <input type="text" id="callerid" v-model="callerId" required>
      
      <label for="context">Context:</label>
      <input type="text" id="context" v-model="context" required>
      
      <button type="submit">Submit</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      extensionNumber: null,
      secret: '',
      callerId: '',
      context: ''
    };
  },
  methods: {
    submitForm() {
      const formData = {
        extensionNumber: this.extensionNumber,
        secret: this.secret,
        callerId: this.callerId,
        context: this.context
      };
      
      // Emit an event with the form data
      this.$emit('formSubmitted', formData);
      
      // Reset the form fields
      this.extensionNumber = null;
      this.secret = '';
      this.callerId = '';
      this.context = '';
    }
  }
};
</script>