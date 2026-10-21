# MayaXpense

A calm, mobile-first budget and expense tracker. Static, dependency-free, and ready for Vercel. No database, backend, API keys, paid services, external fonts, or runtime dependencies.

## Run

Requires Node.js 20+.

```sh
npm run dev
```

Open **http://127.0.0.1:5180**. Create a profile or choose **Explore the live demo**. Demo changes stay in memory and never modify real profiles.

```sh
npm run check
npm test
npm run build
```

The build creates `dist/`.

## Deploy to Vercel

Import this folder as a standalone Git project. If deploying from a containing repository, ensure the folder is included in that repository (not ignored) and select **MayaXpense** as the Root Directory. Use framework preset **Other**, build command **npm run build**, and output directory **dist**. The included `vercel.json` configures those settings and security headers. Alternatively, run `npx vercel` from this folder. No environment variables are needed. Serve the app at the domain root over HTTPS.

## Included

- Separate username/password profiles, up to 15 per browser, with AES-256-GCM encrypted local vaults.
- Expense, income, and transfers with dates, notes, tags, categories, account selection, and optional receipt images.
- Multiple bank, cash, credit/loan, savings, and manually valued investment accounts. Negative balances represent liabilities. Transfers preserve net balance and do not count as income or expenses.
- Monthly category budgets, overspending indicators, budget alerts, remaining daily allocation, and copy from previous month without replacing existing categories.
- Savings goals with target dates, progress, monthly target suggestions, and editable earmarks.
- Weekly, monthly, and yearly recurring bills/income. Recording one occurrence creates a transaction today and advances the due date by one interval. These are manual reminders; there are no automatic charges, background jobs, or notifications while closed.
- Six-month cash-flow charts, category breakdowns, monthly savings rate, daily average, largest expense, and a simple current-month spending projection.
- Search/filter/sort transactions, 25-row pagination, and future-dated entries. Future entries appear in Transactions, and affect account balances and analytics only when their date arrives.
- Custom expense categories with names, icons, and colors.
- Encrypted full backups and restore into a separate profile. Readable transaction CSV export, CSV example, and validated CSV import with exact duplicate skipping.
- Light, dark, and system themes. Currency labels for INR, USD, EUR, GBP, AUD, CAD, SGD, AED; changing currency does not convert amounts.
- Responsive mobile navigation, receipt camera capture on supported browsers, optional vibration, swipe the page heading to switch months, keyboard shortcuts, and installable PWA with offline app-shell caching after first load.
- Password changes, inactivity lock (5/15/30 minutes), safe rendering of user content, cross-tab conflict detection and browser Web Locks where supported, recoverable deletion via the Undo toast.

## Important storage and security behavior

**These are encrypted browser-local profiles, not online authenticated accounts.** Each browser/device has its own independent profiles and data. A static site cannot enforce a shared user limit, synchronize devices, or provide server-enforced access control. Fifteen is the per-browser profile limit, not a global deployment limit. People visiting the same deployed URL on other devices create independent local profiles. Use encrypted backup/restore to move data; it creates a separate local copy, not synchronization.

Usernames are stored as readable local profile metadata. Financial records (including display name and receipt images) are encrypted using AES-256-GCM. The encryption key is derived from the password with PBKDF2-SHA-256, 310,000 iterations and a random 128-bit salt. Each save uses a fresh 96-bit IV. Keys exist only in memory while unlocked; refreshing requires signing in again. A strong, unique password matters. No password is sent to a server. HTTPS or localhost is required for Web Crypto and PWA support.

There is **no password reset**. Keep your password and download regular encrypted backups. Clearing browser site data, private browsing, storage eviction, or moving to another origin may remove or isolate your records. A malicious browser extension, compromised host code, or someone using an unlocked device can access unlocked data; client-side encryption is not a substitute for trusted devices and hosting. Exported CSV is unencrypted. Backups keep the password they had when exported even after you change your current profile password.

Data is stored under `mayaxpense:profiles:v1` and `mayaxpense:vault:<profile-id>` in localStorage. Browser storage quotas vary; receipts are compressed to 1,000px longest edge and must fit under 450,000 encoded characters. Export backups regularly. A save failure is reported and the unsaved change is not applied. Import limits are 30,000 total transactions, 5,000 CSV rows per import, 100 accounts/categories, 200 goals, and 500 recurring items. For best results, edit one vault in one tab at a time. Web Locks serialize saves in supporting browsers; revision checks reject stale writes. Other tabs lock when a changed vault is detected.

Savings goals are **earmarks only**, not additional assets or money transfers. They do not change account balances or count as expenses. Avoid earmarking more than your actual savings. Budgets compare only their categories; unbudgeted spending is shown separately. All monetary values use integer minor units with two decimal places. Investment values and bank balances are entered manually; the app does not provide live market data, bank sync, exchange rates, financial advice, or actual payments.

The service worker caches only application assets, never decrypted financial data. Install behavior and camera/haptics support depend on the browser and device. Offline mode needs a successful first online load. New app versions become active after older tabs close. The app does not request microphone, location, motion-sensor, or notification access.

## Shortcuts

- **N**: add a transaction (outside text fields).
- **/**: open transaction search.
- **Escape**: close a dialog.
- Swipe left/right on page headings: next/previous reporting month.

## Design references

The feature plan draws on [YNAB’s targets](https://support.ynab.com/how-to-use-targets-rk5kkI9ks) and [spending breakdowns](https://support.ynab.com/en_us/spending-breakdown-H1H7YxmD0?mobile-help=true). MayaXpense has its own visual design and an intentionally local data model.

## Files

`src/app.js` implements interface and workflows; `src/model.js` handles dates, money, validation, and reports; `src/vault.js` handles password encryption and persistence; `src/styles.css` contains responsive themes. `sw.js` caches the app shell. Tests cover financial invariants, imports, date recurrence, encryption, independent profiles, storage failures, and save conflicts.
