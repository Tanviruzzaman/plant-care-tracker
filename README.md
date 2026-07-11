# 🌱 Plant Care Tracker

A small Flutter app that lets you track your plants, give each one a **health
score (0–100)**, and see an automatic **health grade** (A / B / C / F) plus a
live summary of your whole garden.

Built for the *Student Grade Tracker* assignment — reskinned as a plant tracker.
The internal `Plant` model plays the role of the required "Subject" class (it has
a **private `_mark` field** and a **`grade` getter**), themed as plant health.

## What the app does

- **Add Plant** — a validated form (name required, score must be 0–100).
- **My Plants** — every plant in a `ListView.builder`; **swipe left to delete**
  (Dismissible). Each row shows name, score, grade, and status.
- **Summary** — total plants, average health, overall grade, and how many need
  attention. Updates **live** as you add or remove plants.
- **Light / dark theme** — toggle from the icon in the AppBar. Both themes are
  fully custom; every color comes from `Theme.of(context)`.

## How grades work

| Health score | Grade | Status      |
|--------------|-------|-------------|
| 80 – 100     | A     | Thriving    |
| 65 – 79      | B     | Healthy     |
| 50 – 64      | C     | Needs Care  |
| 0 – 49       | F     | Critical    |

## How to run

You need the [Flutter SDK](https://docs.flutter.dev/get-started/install)
installed (Dart 3.12+).

```bash
# 1. Get the dependencies
flutter pub get

# 2. Run the app (pick any connected device / emulator / Chrome)
flutter run
```

To run the tests:

```bash
flutter test
```

## Project structure

```
lib/
├── main.dart                     # App entry, MultiProvider + MaterialApp
├── models/
│   └── plant.dart                # Plant model: private _mark + grade getter
├── providers/
│   ├── plant_provider.dart       # List<Plant>, averages, overall grade
│   └── theme_provider.dart       # Light/dark toggle
├── theme/
│   └── app_themes.dart           # Custom light & dark ThemeData
└── screens/
    ├── home_screen.dart          # BottomNavigationBar + AppBar theme toggle
    ├── add_plant_screen.dart     # Screen 1 — form + validation
    ├── plant_list_screen.dart    # Screen 2 — ListView + Dismissible
    └── summary_screen.dart       # Screen 3 — live summary
```

## Notes

- **State management:** 100% [Provider](https://pub.dev/packages/provider).
  There is **no `setState`** anywhere in the app.
- **Data is in-memory** — the app needs **no API and no internet**. Plants reset
  when the app restarts.
# plant-care-tracker
