<<<<<<< HEAD
# UICT Online Attendance — Flutter App

Flutter client for the UICT Online Attendance Portal, implementing the
**Executive Precision** design system (see `design/DESIGN.md` for the full
token spec and `design/reference-screen.png` for the source mock).

## Theme

- **Primary:** Electric Indigo `#4F46E5` (buttons), Deep Indigo `#3525CD` (links/text accents)
- **Secondary:** Cobalt Blue `#0058BE` / `#2170E4`
- **Tertiary (success):** Emerald `#10B981`
- **Surfaces:** `#FAF8FF` background, `#FFFFFF` cards, `#F2F3FF` input fills
- **Typography:** Plus Jakarta Sans (headlines) + Inter (body/labels)
- Material 3, 8px input/button radius, 16px card radius, soft ambient shadows.
=======
# Lubwama Maurice App

A Flutter application scaffolded with a modern, professional login screen.

## Theme

- **Primary:** Deep indigo `#3D3AF1`
- **Accent:** Teal `#17C3B2`
- **Typography:** Poppins (headings) + Inter (body), via `google_fonts`
- Material 3, light theme, rounded 14px inputs/buttons, soft shadows.
>>>>>>> 9a3fef343dff0c239964b9b7a5b9b2a2490e37ad

## Project structure

```
<<<<<<< HEAD
design/
  DESIGN.md               # Full design token spec (colors, type, spacing, components)
  reference-screen.png     # Source mock of the login screen
lib/
  main.dart                 # App entry point
  theme/
    app_theme.dart          # Color tokens + ThemeData matching the design system
  screens/
    login_screen.dart       # Login screen: Registration Number + Password, SSO, footer
=======
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
>>>>>>> 9a3fef343dff0c239964b9b7a5b9b2a2490e37ad
```

## Getting started

<<<<<<< HEAD
The `lib/` code and `pubspec.yaml` were hand-authored. Platform folders
(`android/`, `ios/`, `web/`, etc.) aren't included yet — generate them
locally with:
=======
This project's `lib/` code and `pubspec.yaml` were hand-authored. The
platform-specific folders (`android/`, `ios/`, `web/`, etc.) are **not**
included yet — generate them locally with:
>>>>>>> 9a3fef343dff0c239964b9b7a5b9b2a2490e37ad

```bash
flutter create .
flutter pub get
flutter run
```

<<<<<<< HEAD
`flutter create .` scaffolds the platform folders in place without
touching the existing `lib/` or `pubspec.yaml`.

## Dependencies

- `google_fonts` — Plus Jakarta Sans + Inter
- `provider` — ready for wiring up auth state
- `cupertino_icons`

## Next steps

- Wire `_handleSubmit` in `login_screen.dart` to the real UICT auth API.
- Add sign-up and forgot-password screens (links are already stubbed in).
- Wire up Google/GitHub SSO buttons.
- Run `flutter create .` and add app icon/splash matching the brand mark.
=======
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
>>>>>>> 9a3fef343dff0c239964b9b7a5b9b2a2490e37ad
