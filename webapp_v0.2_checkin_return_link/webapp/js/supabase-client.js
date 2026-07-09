/**
 * Supabase client initialization.
 *
 * SETUP: after creating your Supabase project (supabase.com/dashboard),
 * go to Project Settings > API and copy your Project URL and anon/public
 * key into the two constants below. The anon key is safe to expose in
 * frontend code — it's designed for that, and Row Level Security (the
 * policies in schema.sql) is what actually protects your data, not
 * keeping this key secret.
 */

const SUPABASE_URL = 'https://aeonfmiqaihflcpjfxrd.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_eZ_EfrhcXLtM6QsXCl1tKw_RMYFhDSz';

// Loaded via CDN script tag in each HTML file before this script runs.
// Named `supabaseClient` (not `supabase`) deliberately — the CDN library
// itself creates a global called `window.supabase`, and reusing that
// exact name for our own variable causes a SyntaxError.
const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

/**
 * Redirect to login if there's no active session.
 * Call this at the top of any page that requires auth.
 */
async function requireAuth() {
  const { data: { session } } = await supabaseClient.auth.getSession();
  if (!session) {
    window.location.href = 'login.html';
    return null;
  }
  return session;
}
