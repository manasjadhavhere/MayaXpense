# Verification

- `npm run check`: passed.
- `npm test`: 11 tests passed, including money calculations, transfer invariants, future entries, recurring date anchors, backup validation, safe imported IDs, CSV parsing, encryption, password rejection, tamper rejection, independent profiles, stale saves, and storage failure.
- `npm run build`: passed; `dist/` contains the complete static site.
- Browser verified on the local preview: demo entry, expense creation, changed totals, search, editing dialog, deletion, undo, budget editing and overspending feedback, recurring transaction recording and next-date advancement, savings earmarks, transfer entry preserving total balance, and light/dark appearance.
- Responsive checks used desktop and phone viewport overrides. Phone transactions use cards; overview and transaction pages did not overflow horizontally. Phone dialogs were visually inspected. Browser console reported no warnings or errors during the checked flows.
- Receipt camera capture, vibration, home-screen installation, and offline behavior require browser/device support. Their implementation is included; physical phone sensors and a production Vercel deployment were not tested.
- Local encryption/profile persistence is covered by automated tests. No real bank data or personal credentials were used during verification.

`preview-light.png`, `preview-dark.png`, and `preview-mobile.png` show the sample demo workspace. These are illustrative data, not personal financial records.
