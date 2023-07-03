<template>
  <div class="form-container">
    <h2>Add Data</h2>
    <form @submit.prevent="submitForm" class="form">
      <label for="extension" class="form-label">Extension Number:</label>
      <input type="number" id="extension" v-model="extensionNumber" class="form-input" required>
      
      <label for="secret" class="form-label">Secret:</label>
      <input type="password" id="secret" v-model="secret" class="form-input" required>
      
      <label for="callerid" class="form-label">Caller ID:</label>
      <input type="text" id="callerid" v-model="callerId" class="form-input" required>
      
      <label for="context" class="form-label">Context:</label>
      <input type="text" id="context" v-model="context" class="form-input" required>
      
      <button type="submit" class="form-button">Submit</button>
    </form>
  </div>
</template>

<style scoped>
.form-container {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
}

.form {
  display: flex;
  flex-direction: column;
}

.form-label {
  font-weight: bold;
  margin-bottom: 5px;
}

.form-input {
  padding: 8px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.form-button {
  padding: 10px;
  background-color: #007BFF;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.form-button:hover {
  background-color: #0056b3;
}
</style>

<script>
import axios from 'axios';
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

      axios.post('http://10.149.127.53:3000/api/submit-form', formData)
        .then(response => {
          console.log(response.data);
        })
        .catch(error => {
          console.error(error);
        });
    
      
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