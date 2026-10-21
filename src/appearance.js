export const themes = [['light', 'Light'], ['dark', 'Dark'], ['system', 'Follow device']];
export const colors = [['forest', 'Forest'], ['ocean', 'Ocean'], ['plum', 'Plum']];

// Appearance is device-local and must never prevent the app/demo from opening.
function read(key, choices, fallback) {
  try {
    const value = localStorage.getItem(key);
    return choices.some(([id]) => id === value) ? value : fallback;
  } catch { return fallback; }
}
export const appearance = {
  theme: read('mayaxpense:theme', themes, 'light'),
  color: read('mayaxpense:color', colors, 'forest')
};
export function setAppearance(theme, color) {
  if (!themes.some(([id]) => id === theme) || !colors.some(([id]) => id === color)) return;
  Object.assign(appearance, {theme, color});
  try {
    localStorage.setItem('mayaxpense:theme', theme);
    localStorage.setItem('mayaxpense:color', color);
  } catch { /* Still allow an in-memory preference when storage is unavailable. */ }
}
