# Verification

- `npm run check`: passed.
- `npm test`: 13 tests passed, including saved/invalid appearance preferences and blocked browser storage, money calculations, transfer invariants, future entries, recurring date anchors, backup validation, safe imported IDs, CSV parsing, encryption, password rejection, tamper rejection, independent profiles, stale saves, and storage failure.
- `npm run build`: passed; `dist/` contains the complete static site.
- Browser verified on the local preview: demo entry, expense creation, changed totals, search, editing dialog, deletion, undo, budget editing and overspending feedback, recurring transaction recording and next-date advancement, savings earmarks, transfer entry preserving total balance, and light/dark appearance.
- Responsive checks used desktop and phone viewport overrides. Phone transactions use cards; overview and transaction pages did not overflow horizontally. Phone dialogs were visually inspected. Browser console reported no warnings or errors during the checked flows.
- Offline reload, local-profile unlock, and saving an expense were verified after stopping the local static server. The updated service-worker cache includes the appearance module. First load still requires a connection.
- Receipt camera capture, vibration, and home-screen installation require browser/device support. Physical phone sensors and a production Vercel deployment were not tested.
- Local encryption/profile persistence is covered by automated tests. No real bank data or personal credentials were used during verification.

`preview-light.png`, `preview-dark.png`, and `preview-mobile.png` show the sample demo workspace. These are illustrative data, not personal financial records.

## Mobile UI update — 22 October 2026

- Sign-in fits without page scrolling at effective CSS viewport sizes 320×569, 360×640, 390×844, 767×1024 and 1366×769. Phone inputs are 16px; action targets are at least 44px. Shorter screens, larger text, keyboard use, signup, and expanded help can scroll to keep content accessible.
- All eight workspace screens were checked for horizontal page overflow at 320px and 1366px widths; none was found. Tablet dashboard and mobile dialogs were visually inspected.
- Both recent and full transaction lists reflow into phone cards. Filters wrap into two columns. Chart labels retain readable CSS text sizes instead of shrinking inside an SVG.
- Forest, Ocean and Plum colors are selectable from sign-in, the workspace header and Settings, with Light, Dark and Follow device modes. Light Plum and Dark Ocean were visually checked. Appearance survived reload, and opening/changing appearance retained an unsaved settings display name and typed login username.
- A synthetic local profile was created, an expense saved, the page reloaded, and the profile unlocked to confirm persistence. A second expense was saved with the static server stopped. Demo creation and transaction search also passed.
- Browser logs were clear of application errors and warnings during online checks.

## Brand asset update — 22 October 2026

- Supplied main logo adapted into a transparent header lockup; supplied favicon used for browser, Apple touch and PWA icons. Source images are preserved under `assets/`.
- Sign-in and dashboard logos load on mobile and desktop. Sign-in remains within a 320×569 CSS viewport, and the mobile dashboard has no horizontal page overflow.
- `npm run check`, `npm run build` and `git diff --check` passed. Static build and service-worker cache include the new logo and favicon.
