# AQVYNTRA by ZEQTRION

Flutter UX refresh based on `codex/v11-readiness-features` at `e6d07e3`.

## Preserved
Onboarding, register/sign-in, stored session, account deletion, sign-out, legal pages,
Home, Analytics, History, Device and Profile. Existing API URL build variable,
secure-storage keys, package name and application identifiers are retained for compatibility.

## Improved
AQVYNTRA branding, teal/ink theme, signed-in greeting, dashboard hierarchy,
working navigation shortcuts, tab scroll preservation, tablet navigation rail,
explicit sample-data notice and explanatory feedback for unconnected device actions.

## Source limitations
This branch is not the complete later v11 app. Dashboard/analytics/history/device
values are fixtures, and dispensing/restart/diagnostics have no backend implementation.
Camera inference, PPG research, pairing and live telemetry are not present in this source.
No hardware command is sent by this UI refresh.

## Build
Use a Flutter SDK containing Dart 3.12.2 or newer, matching the inherited pubspec constraint.

```sh
flutter pub get
flutter analyze
flutter test
flutter build apk --debug --dart-define=AQUASENSE_API_BASE_URL=https://YOUR_SERVER
```

The app uses dart:io in its inherited API client and targets mobile, not Flutter web.
Use the existing trusted server URL; no production endpoint is embedded.

## Validation
Relative Dart imports and whitespace were checked during editing.
Flutter SDK/Android SDK are unavailable in the editing environment, so widget tests,
analysis, rendered layout and APK build remain unverified. The new tests cover
signed-in greeting, shortcut navigation, device feedback and tablet navigation.
