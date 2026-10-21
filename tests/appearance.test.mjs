import test from 'node:test';
import assert from 'node:assert/strict';

test('appearance survives reloads and rejects unknown saved values', async () => {
  const store = new Map([['mayaxpense:theme', 'system'], ['mayaxpense:color', 'ocean']]);
  globalThis.localStorage = {getItem: k => store.get(k), setItem: (k, v) => store.set(k, v)};
  const first = await import('../src/appearance.js?first');
  assert.deepEqual(first.appearance, {theme: 'system', color: 'ocean'});
  first.setAppearance('dark', 'plum');
  const reloaded = await import('../src/appearance.js?reload');
  assert.deepEqual(reloaded.appearance, {theme: 'dark', color: 'plum'});
  reloaded.setAppearance('invalid', 'forest');
  assert.deepEqual(reloaded.appearance, {theme: 'dark', color: 'plum'});
  store.set('mayaxpense:theme', 'invalid');
  store.set('mayaxpense:color', 'invalid');
  const invalid = await import('../src/appearance.js?invalid');
  assert.deepEqual(invalid.appearance, {theme: 'light', color: 'forest'});
});

test('blocked browser storage still permits startup and in-memory appearance changes', async () => {
  globalThis.localStorage = {
    getItem() { throw new Error('Storage blocked'); },
    setItem() { throw new Error('Storage blocked'); }
  };
  const {appearance, setAppearance} = await import('../src/appearance.js?blocked');
  assert.deepEqual(appearance, {theme: 'light', color: 'forest'});
  assert.doesNotThrow(() => setAppearance('dark', 'ocean'));
  assert.deepEqual(appearance, {theme: 'dark', color: 'ocean'});
});
