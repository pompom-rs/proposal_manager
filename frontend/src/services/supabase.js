import { createClient } from '@supabase/supabase-js'

// Načtení proměnných prostředí z .env souboru
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || 'http://localhost:8000'
const supabaseKey = import.meta.env.VITE_SUPABASE_PUBLIC_KEY

// Kontrola, zda jsou nastavené proměnné prostředí
if (!supabaseKey) {
  console.warn('VITE_SUPABASE_PUBLIC_KEY není nastaven. Použijte .env soubor pro nastavení přístupových údajů.')
}

// Vytvoření Supabase klienta
const supabase = createClient(supabaseUrl, supabaseKey || 'public-anon-key')

// Funkce pro testování připojení k Supabase
export const testConnection = async () => {
  try {
    const { data, error } = await supabase.from('users').select('count').limit(1)
    if (error) throw error
    console.log('Supabase připojení úspěšné:', data)
    return true
  } catch (error) {
    console.error('Chyba při připojování k Supabase:', error.message)
    return false
  }
}

export default supabase
