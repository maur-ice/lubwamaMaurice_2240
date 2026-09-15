# Lubwama Maurice App

A Flutter application scaffolded with a modern, professional login screen.

## Theme

- **Primary:** Deep indigo `#3D3AF1`
- **Accent:** Teal `#17C3B2`
- **Typography:** Poppins (headings) + Inter (body), via `google_fonts`
- Material 3, light theme, rounded 14px inputs/buttons, soft shadows.

## Project structure

```
lib/
  main.dart                 # App entry point
  theme/
    app_theme.dart          # Colors + ThemeData
  screens/
    login_screen.dart       # Login screen (email/password, validation, social buttons)
  widgets/
    app_text_field.dart     # Reusable styled text field
assets/
  images/                   # App image assets
```

## Getting started

This project's `lib/` code and `pubspec.yaml` were hand-authored. The
platform-specific folders (`android/`, `ios/`, `web/`, etc.) are **not**
included yet — generate them locally with:

```bash
flutter create .
flutter pub get
flutter run
```

`flutter create .` will scaffold the platform folders in place without
touching the existing `lib/` or `pubspec.yaml` files.

## Dependencies

- `google_fonts` — modern typography
- `provider` — lightweight state management, ready for wiring up auth logic
- `cupertino_icons` — iOS-style icons

## Next steps

- Wire `_handleLogin` in `login_screen.dart` to a real auth service (e.g. Firebase Auth, or your backend API).
- Add a sign-up screen and forgot-password flow (buttons are already stubbed in).
- Add app icons/splash screen once `flutter create .` has been run.
