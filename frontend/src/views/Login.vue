<template>
  <v-container fluid class="fill-height">
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="6" lg="4">
        <v-card class="elevation-12">
          <v-card-title class="text-center">
            <h1 class="text-h5">Přihlášení</h1>
          </v-card-title>
          <v-card-text>
            <v-form @submit.prevent="login">
              <v-text-field
                v-model="email"
                label="E-mail"
                prepend-icon="mdi-email"
                type="email"
                required
              ></v-text-field>
              <v-text-field
                v-model="password"
                label="Heslo"
                prepend-icon="mdi-lock"
                type="password"
                required
              ></v-text-field>
              <v-checkbox
                v-model="rememberMe"
                label="Zapamatovat si mě"
              ></v-checkbox>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" @click="login">
              Přihlásit se
            </v-btn>
            <v-spacer></v-spacer>
          </v-card-actions>
          <v-card-text class="text-center">
            <v-btn variant="text" color="primary" prepend-icon="mdi-google">
              Přihlásit se přes Google
            </v-btn>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const email = ref('')
const password = ref('')
const rememberMe = ref(false)

const login = () => {
  // Zde bude implementace přihlášení
  console.log('Přihlášení s:', { email: email.value, password: password.value, rememberMe: rememberMe.value })
  
  // Simulace úspěšného přihlášení
  localStorage.setItem('user', JSON.stringify({ email: email.value }))
  router.push('/dashboard')
}
</script>
