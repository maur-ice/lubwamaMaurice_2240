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

## Project structure

```
design/
  DESIGN.md               # Full design token spec (colors, type, spacing, components)
  reference-screen.png     # Source mock of the login screen
lib/
  main.dart                 # App entry point
  theme/
    app_theme.dart          # Color tokens + ThemeData matching the design system
  screens/
    login_screen.dart       # Login screen: Registration Number + Password, SSO, footer
```

## Getting started

The `lib/` code and `pubspec.yaml` were hand-authored. Platform folders
(`android/`, `ios/`, `web/`, etc.) aren't included yet — generate them
locally with:

```bash
flutter create .
flutter pub get
flutter run
```

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
