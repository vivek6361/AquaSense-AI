# V11 readiness work

This branch adds Flutter startup onboarding, backend login/registration wiring, secure token storage, basic client-side form checks, visible loading/error states, and draft privacy/terms screens.

## Required build configuration

Build with `--dart-define=AQUASENSE_API_BASE_URL=https://YOUR_API_DOMAIN`. Release builds must use HTTPS. Run `flutter pub get` after the dependency change, then run the app tests and build a signed APK.

## Still requiring product or deployment setup

- Password-reset and email-verification flows need an email delivery provider, token storage, templates, and backend endpoints.
- Account deletion needs an agreed data-retention policy and verified cascade behavior before exposing a destructive control.
- Rate limiting should be configured at the API gateway or with a shared Redis-backed limiter; an in-process limiter is not sufficient across multiple workers.
- Database backups and restore tests must be configured for the actual PostgreSQL host.
- Row-level database policies are not enabled; the backend currently applies authenticated user scoping in its query layer.
- Analytics and crash reporting require a chosen provider, consent/retention decisions, and deployment configuration. The analytics screen is not event tracking.
- The policy text is explicitly draft and must be replaced with approved legal content before release.
- The current dashboard still has hard-coded sample readings and is not connected to live endpoints by this branch.
