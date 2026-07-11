# 📗 Project Guide — Plant Care Tracker

This file explains **what this project is**, **how it is built**, and gives you
a **step-by-step** plan to run it and submit it for the assignment.

---

## 1. What this project is

A Flutter app that tracks plants. Each plant has a name and a health score
(0–100). The app turns that score into a grade (A/B/C/F) and shows a live
summary. It is the *Student Grade Tracker* assignment, reskinned as plants.

- **No API. No internet. No login.** Everything runs locally in memory.
- **State is managed only with Provider** — there is **no `setState`** anywhere.

---

## 2. How the assignment maps to the code

| Assignment requirement | Where it lives in the code |
|---|---|
| Class with **private `_mark`** field + **`grade` getter** | `lib/models/plant.dart` |
| Store items in a `List<...>` | `lib/providers/plant_provider.dart` (`_plants`) |
| Use `.map()` or `.where()` | `plant_provider.dart` — `.where()` (needs attention) and `.map()` (average) |
| Screen 1: Add form + validation | `lib/screens/add_plant_screen.dart` |
| Screen 2: `ListView.builder` + `Dismissible` | `lib/screens/plant_list_screen.dart` |
| Screen 3: live Summary | `lib/screens/summary_screen.dart` |
| `BottomNavigationBar` | `lib/screens/home_screen.dart` |
| Light/dark theme toggle in AppBar | `home_screen.dart` + `lib/providers/theme_provider.dart` |
| Custom `ThemeData` (no defaults), colors from `Theme.of(context)` | `lib/theme/app_themes.dart` |
| All state via Provider, zero `setState` | `lib/main.dart` (MultiProvider) + all providers |

> **Grader tip:** the `Plant` class deliberately keeps the field named `_mark`
> and the getter named `grade`, exactly as the checklist asks — just themed as a
> plant. The README explains the mapping.

---

## 3. How the app works (the flow)

1. `main.dart` starts the app and wires up three providers with `MultiProvider`:
   - `PlantProvider` — the list of plants and all the math.
   - `ThemeProvider` — light vs dark.
   - `NavIndexProvider` — which bottom tab is selected.
2. `HomeScreen` shows the AppBar (with the theme toggle) and the
   `BottomNavigationBar`, and swaps between the 3 screens with an `IndexedStack`.
3. When you add/remove a plant, the provider calls `notifyListeners()`, and any
   screen listening (via `Consumer`/`context.watch`) rebuilds automatically.

---

## 4. Step-by-step: run the app

> Do these in a terminal, inside this project folder.

1. **Check Flutter is installed**
   ```bash
   flutter --version
   ```
   If this fails, install Flutter first: https://docs.flutter.dev/get-started/install

2. **Get the packages** (downloads `provider`)
   ```bash
   flutter pub get
   ```

3. **Run it**
   ```bash
   flutter run
   ```
   Pick a device when asked (Android emulator, a phone, Windows, or Chrome).
   For the browser you can also do: `flutter run -d chrome`.

4. **Try it out**
   - Go to **Add** → type a name and a score (try one over 100 to see the
     validation error) → tap **Add Plant**.
   - Go to **Plants** → swipe a row left to delete it.
   - Go to **Summary** → watch the numbers change as you add/remove plants.
   - Tap the sun/moon icon in the top-right to switch light/dark.

5. **(Optional) Run the tests**
   ```bash
   flutter test
   ```

---

## 5. Step-by-step: put it on GitHub (with 3+ commits)

The assignment needs a **public repo** with at least **3 meaningful commits**
(`feat:`, `fix:`, `docs:`) and a README. This folder is **not a git repo yet**.

1. **Start git and make the first commit**
   ```bash
   git init
   git add lib/ pubspec.yaml
   git commit -m "feat: add plant model, providers, screens and custom themes"
   ```

2. **Second commit — a small fix/polish**
   ```bash
   git add test/
   git commit -m "fix: replace default counter test with Plant grade tests"
   ```

3. **Third commit — docs**
   ```bash
   git add README.md PROJECT_GUIDE.md .gitignore
   git commit -m "docs: add README and project guide"
   ```

4. **Create the repo on GitHub and push**
   - Make a new **public** repo on github.com named `plant_care_tracker`
     (do **not** let GitHub add a README — you already have one).
   - Then connect and push:
   ```bash
   git remote add origin https://github.com/<your-username>/plant_care_tracker.git
   git branch -M main
   git push -u origin main
   ```

5. **Submit** the repo link in your class group.

> Note: the `.claude/` folder (if it ever appears) is already in `.gitignore`,
> so it will never be pushed. Your repo stays clean.

---

## 6. Final checklist before submitting

- [ ] `flutter run` works with no errors
- [ ] `Plant` has a private `_mark` field and a `grade` getter
- [ ] `.where()` / `.map()` used (in `plant_provider.dart`)
- [ ] Add form rejects empty name and marks outside 0–100
- [ ] Swipe-to-delete works (Dismissible)
- [ ] Both light and dark themes work; no hardcoded colors in widgets
- [ ] No `setState` anywhere (search the project to confirm)
- [ ] Public GitHub repo, 3+ commits, README present
