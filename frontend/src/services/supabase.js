import { createClient } from '@supabase/supabase-js'

// Načtení proměnných prostředí z .env souboru
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseKey = import.meta.env.VITE_SUPABASE_PUBLIC_KEY

// Vytvoření Supabase klienta
const supabase = createClient(supabaseUrl, supabaseKey)

export default supabase
