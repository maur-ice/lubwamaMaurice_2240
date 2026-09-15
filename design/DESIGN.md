---
name: Executive Precision
colors:
  surface: '#faf8ff'
  surface-dim: '#d2d9f4'
  surface-bright: '#faf8ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f3ff'
  surface-container: '#eaedff'
  surface-container-high: '#e2e7ff'
  surface-container-highest: '#dae2fd'
  on-surface: '#131b2e'
  on-surface-variant: '#464555'
  inverse-surface: '#283044'
  inverse-on-surface: '#eef0ff'
  outline: '#777587'
  outline-variant: '#c7c4d8'
  surface-tint: '#4d44e3'
  primary: '#3525cd'
  on-primary: '#ffffff'
  primary-container: '#4f46e5'
  on-primary-container: '#dad7ff'
  inverse-primary: '#c3c0ff'
  secondary: '#0058be'
  on-secondary: '#ffffff'
  secondary-container: '#2170e4'
  on-secondary-container: '#fefcff'
  tertiary: '#005338'
  on-tertiary: '#ffffff'
  tertiary-container: '#006e4b'
  on-tertiary-container: '#67f4b7'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#e2dfff'
  primary-fixed-dim: '#c3c0ff'
  on-primary-fixed: '#0f0069'
  on-primary-fixed-variant: '#3323cc'
  secondary-fixed: '#d8e2ff'
  secondary-fixed-dim: '#adc6ff'
  on-secondary-fixed: '#001a42'
  on-secondary-fixed-variant: '#004395'
  tertiary-fixed: '#6ffbbe'
  tertiary-fixed-dim: '#4edea3'
  on-tertiary-fixed: '#002113'
  on-tertiary-fixed-variant: '#005236'
  background: '#faf8ff'
  on-background: '#131b2e'
  surface-variant: '#dae2fd'
typography:
  display-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.025em
  display-lg-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 30px
    fontWeight: '700'
    lineHeight: 38px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 28px
    fontWeight: '600'
    lineHeight: 36px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.015em
  headline-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: -0.01em
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
    letterSpacing: -0.01em
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
    letterSpacing: 0em
  body-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
    letterSpacing: 0.005em
  label-lg:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.02em
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 14px
    letterSpacing: 0.04em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1.5rem
  gutter-mobile: 0.75rem
  margin: 2rem
  margin-mobile: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system targets modern enterprise operations, workforce intelligence, and executive personnel management. It bridges high-density administrative oversight with fluid, frictionless employee interaction—from automated biometric and SSO clock-ins to roster scheduling and predictive labor analytics.

The aesthetic fuses **Corporate / Modern** rigor with refined **Glassmorphism** details:
- **Tone:** Authoritative, razor-sharp, frictionless, and premium.
- **Visual Stance:** Deep slate architectures layered with calibrated tonal contrasts, luminous status signals, razor-thin inner glass boundaries, and ergonomic direct-manipulation targets for field and desk workers alike.
- **Emotion:** Reassurance, operational certitude, absolute data clarity, and high-velocity workflow execution.

## Colors

The palette establishes an immediate hierarchy between deep enterprise authority and dynamic operational telemetry:

- **Primary (`#4F46E5` Electric Indigo):** Anchors core actions, active interactive states, primary timeline indicators, and focal biometric scan affordances.
- **Secondary (`#3B82F6` Cobalt Blue):** Supports navigation accents, multi-tenant status tags, secondary metrics, shift grouping, and informational banners.
- **Tertiary (`#10B981` Emerald Green):** Strictly reserved for verified states, geo-fence confirmations, completed clock-ins, and positive workforce delta metrics.
- **Neutral Core (`#0F172A` Obsidian Navy / `#1E293B` Slate Dusk / `#F8FAFC` Crisp Ice):** Grounds layout frameworks. Light mode utilizes `#F8FAFC` as the foundational canvas with crisp `#FFFFFF` elevated cards; dark mode surfaces translate to `#0F172A` foundations stepped up to `#1E293B` structural layers.
- **Sub-status Semantics:** `#F59E0B` (Amber) for pending approvals, geo-drift warnings, and scheduled overtime; `#EF4444` (Crimson) for unauthorized absences and biometric rejection.

## Typography

The typographic hierarchy couples **Plus Jakarta Sans** for structural headlines and data titles with **Inter** for dense numerical tables, transactional forms, and metadata:

- **Plus Jakarta Sans:** Injected at display and heading tiers. Its geometric, slightly rounded character lends contemporary authority without sacrificing structural stability.
- **Inter:** Chosen for continuous prose, workforce rosters, timestamps, and input fields. Its tabular numerals guarantee exact vertical alignment across high-frequency time logs and attendance payroll grids.
- **Hierarchy Rules:** All section labels and operational tags utilize `label-sm` or `label-md` in uppercase styling with deliberate tracking (`0.04em`) to establish clear functional boundaries over dense UI controls.

## Layout & Spacing

This design system uses a flexible 12-column grid system for administrative web workspaces and an adaptive single-to-two-column layout for mobile field views:

- **Desktop (1280px+):** 12 columns, `1.5rem` (24px) gutters, and `2rem` (32px) margins. Main view layouts prioritize fixed or collapsible 260px administrative navigation sidebars, while the main canvas splits dynamically across roster schedules, timeline feeds, and telemetry summaries.
- **Tablet (768px - 1279px):** 8 columns, `1rem` (16px) gutters, `1.5rem` (24px) outer margin. Sidebars collapse into an overlay navigation drawer; multi-step scheduling matrices convert into horizontal segmented carousels.
- **Mobile (< 768px):** 4 columns, `0.75rem` (12px) gutters, `1rem` (16px) margins. Emphasizes thumb-zone navigation: dynamic check-in/out controls, fast action biometric FABs anchored to the lower safe area, and swipeable shift cards.

## Elevation & Depth

Visual depth is built through layered surface containment, subtle ambient occlusion, and micro inner glass strokes rather than heavy drop shadows:

- **Surface Layers:** Base canvas uses `#F8FAFC`. Elevated surfaces (cards, side panels) rest on `#FFFFFF`. Raised contextual panels (flyouts, modal dialogs) sit on elevated containers bordered by crisp, low-contrast inner outlines.
- **Inner Glass Stroke:** All interactive tiles, containers, and cards feature a crisp `1px` inner border tinted with `rgba(15, 23, 42, 0.08)` in light mode (or `rgba(255, 255, 255, 0.12)` in dark mode) paired with an ultra-subtle top highlight `inset 0 1px 0 0 rgba(255, 255, 255, 0.60)`.
- **Ambient Shadow Metrics:**
  - *Resting Card:* `0 1px 3px rgba(15, 23, 42, 0.04), 0 4px 12px rgba(15, 23, 42, 0.02)`.
  - *Interactive Float / Hover:* `0 4px 12px rgba(79, 70, 229, 0.08), 0 12px 28px rgba(15, 23, 42, 0.06)`.
  - *Overlays & Modals:* `0 24px 48px -12px rgba(15, 23, 42, 0.18)` coupled with an active background blur (`backdrop-filter: blur(12px)` over a `rgba(15, 23, 42, 0.40)` scrim).

## Shapes

The design system standardizes on a refined, organic radius architecture:

- **Primary Corner Geometry:** Standard modules (dashboard cards, data tiles, interactive panels) conform to a smooth `1rem` (16px) radius, corresponding to token tier `rounded-lg`.
- **Inputs & Action Elements:** Form fields, standard buttons, and alert strips utilize `0.5rem` (8px) corner curvature, ensuring compact density without visual harshness.
- **Pill Exceptions:** User avatars, verified biometric confirmation badges, micro status pills, and punch-clock trigger throttles implement continuous capsule radii (`9999px`) to immediately separate operational tokens from structural containers.

## Components

### Buttons
- **Primary:** Background in `#4F46E5`, crisp white text, 44px mobile height (40px desktop), corner radius of `0.5rem`. Subtle gradient shimmer overlay on active states.
- **Secondary / SSO:** White or surface container background with a `1px` border of `rgba(15, 23, 42, 0.12)`. Features verified provider iconography (e.g., Okta, Azure AD) aligned left with centered label typography.
- **Biometric Primary Action:** Oversized 56px touch target incorporating an integrated electric indigo radial glow and an embedded optical icon (Face ID / Fingerprint) paired with subtle haptic feedback animations on tap.

### Input Fields & Verification Controls
- **Text & Numeric Inputs:** Solid `#FFFFFF` fill with an understated `1px` border of `#E2E8F0`. Focus transitions smoothly into a `2px` ring in `#4F46E5` with `0 0 0 3px rgba(79, 70, 229, 0.15)`. Labels sit outside in `label-md` with `neutral` styling.
- **Time Log Pickers:** Integrated tabular Inter typography, featuring instant single-tap presets (e.g., "Shift Start", "Meal Break") and stepper selectors.

### Chips & Badges
- **Status Chips:** Height of 24px, pill-shaped radius. Verified status pairs `#10B981` at 12% opacity background with solid `#059669` text and a preceding 6px luminous emerald dot.
- **Filter Chips:** Light slate fill (`#F1F5F9`), transitioning to active `#4F46E5` fill with crisp white text upon activation.

### Cards & Grid Containers
- Standard `16px` (`1rem`) corner radius, `#FFFFFF` fill, and low-contrast perimeter stroke. Card headers place categorical titles alongside right-aligned telemetry badges or dynamic overflow triggers.

### Checkboxes & Radios
- Size 18x18px with `4px` radius on checkboxes and `50%` on radios. Selection transitions from `#CBD5E1` outline into a filled `#4F46E5` interior with a centered, sharp white glyph.

### Specialized Workforce Components
- **Shift Timeline Rail:** Horizontal segmented schedule tracker highlighting scheduled vs. actual hours, with live overtime indicators demarcated in amber stripes.
- **Biometric Verification Modal:** Center-staged high-depth card with live sensor feed boundary, concentric electric-indigo targeting reticle, and instant green lock confirmation state.