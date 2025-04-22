import supabase from './supabase'
import { ref } from 'vue'

// Reaktivní reference pro aktuálního uživatele
export const user = ref(null)

// Načtení uživatele při inicializaci
loadUser()

/**
 * Načte aktuálního uživatele z Supabase session
 */
async function loadUser() {
  const { data } = await supabase.auth.getSession()
  user.value = data?.session?.user || null
}

/**
 * Přihlášení pomocí emailu a hesla
 * @param {string} email - Email uživatele
 * @param {string} password - Heslo uživatele
 * @returns {Promise} - Promise s výsledkem přihlášení
 */
export async function login(email, password) {
  const { data, error } = await supabase.auth.signInWithPassword({
    email,
    password
  })
  
  if (error) throw error
  
  user.value = data.user
  return data
}

/**
 * Přihlášení pomocí Google OAuth
 * @returns {Promise} - Promise s výsledkem přihlášení
 */
export async function loginWithGoogle() {
  const { data, error } = await supabase.auth.signInWithOAuth({
    provider: 'google'
  })
  
  if (error) throw error
  
  return data
}

/**
 * Registrace nového uživatele
 * @param {string} email - Email uživatele
 * @param {string} password - Heslo uživatele
 * @returns {Promise} - Promise s výsledkem registrace
 */
export async function register(email, password) {
  const { data, error } = await supabase.auth.signUp({
    email,
    password
  })
  
  if (error) throw error
  
  return data
}

/**
 * Odhlášení uživatele
 * @returns {Promise} - Promise s výsledkem odhlášení
 */
export async function logout() {
  const { error } = await supabase.auth.signOut()
  
  if (error) throw error
  
  user.value = null
}

/**
 * Obnovení hesla
 * @param {string} email - Email uživatele
 * @returns {Promise} - Promise s výsledkem odeslání emailu pro obnovení hesla
 */
export async function resetPassword(email) {
  const { error } = await supabase.auth.resetPasswordForEmail(email)
  
  if (error) throw error
}

/**
 * Nastavení nového hesla po obnovení
 * @param {string} password - Nové heslo
 * @returns {Promise} - Promise s výsledkem nastavení nového hesla
 */
export async function updatePassword(password) {
  const { data, error } = await supabase.auth.updateUser({
    password
  })
  
  if (error) throw error
  
  return data
}

// Nastavení posluchače pro změny autentizace
supabase.auth.onAuthStateChange((event, session) => {
  user.value = session?.user || null
})
