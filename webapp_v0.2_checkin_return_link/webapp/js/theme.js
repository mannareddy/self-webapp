/**
 * Theme toggle — dark/light, matching 42self.xyz's own toggle.
 *
 * Uses the SAME localStorage key ('selfTheme') as the main website,
 * so this is a natural companion to the site's own toggle, not a
 * separate preference system.
 *
 * The actual theme-on-load application happens in a tiny inline
 * <script> in each page's <head> (see any page's source) — that has
 * to run before first paint to avoid a flash of the wrong theme,
 * which an externally-loaded file like this one can't guarantee.
 * This file only needs to handle the toggle button click itself.
 */

function syncThemeToggleIcon() {
  const btn = document.getElementById('theme-toggle-btn');
  if (!btn) return;
  const isLight = document.documentElement.getAttribute('data-theme') === 'light';
  btn.textContent = isLight ? '\u263E' : '\u2600'; // ☾ or ☀
}

function toggleAppTheme() {
  const html = document.documentElement;
  const isLight = html.getAttribute('data-theme') === 'light';
  const next = isLight ? 'dark' : 'light';
  html.setAttribute('data-theme', next === 'light' ? 'light' : '');
  localStorage.setItem('selfTheme', next);
  syncThemeToggleIcon();
}

document.addEventListener('DOMContentLoaded', syncThemeToggleIcon);
