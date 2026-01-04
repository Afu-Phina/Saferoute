# saferoad_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:


For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# Saferoute

A Flutter project — Saferoute mobile/web app.

## Getting Started

This project is a Flutter application. To run locally you need Flutter installed.

Quick local run (mobile):

- Install Flutter SDK: https://docs.flutter.dev/get-started/install
- From the repo root run:

```bash
flutter pub get
flutter run
```

Run web locally:

```bash
flutter pub get
flutter run -d chrome
```

## Deployment (Free options)

This repository includes a GitHub Actions workflow that builds the Flutter web app and deploys it to GitHub Pages for free.

How it works
- On push to the `main` branch the workflow runs `flutter build web --release` and publishes the `build/web` folder to the `gh-pages` branch using the repository's `GITHUB_TOKEN`.

Quick steps to enable and use
1. Push your code to the `main` branch on GitHub.
2. In your repository on GitHub: go to Settings → Pages and configure the site to use the `gh-pages` branch (root folder). The site URL will be provided by GitHub Pages.

Notes and verifications
- The workflow file is at `.github/workflows/deploy-web.yml`.
- The build requires Flutter web support. If you haven't enabled web locally, you can still use the workflow because Actions installs Flutter.
- After a successful run check the Actions tab for logs; the published site should appear at the GitHub Pages URL.

Alternative free hosts
- Netlify: Drag & drop the `build/web` folder or connect your repo and set the build command to `flutter build web --release` and publish the `build/web` folder.
- Firebase Hosting (free tier): Use `firebase init hosting` and `firebase deploy` after building `build/web` locally or from CI.

Notes about mobile distribution
- GitHub Pages and Netlify host web builds only. To distribute the Android/iOS apps you'll need to build APKs/IPA. Publishing to Google Play or the App Store may require fees (Google Play has a one-time fee, App Store requires a paid developer account).

Troubleshooting
- Large assets may increase build time — consider optimizing images.
- If the Action fails on Flutter setup, open the Action logs to see the failing step; typical fixes are updating `flutter-version` or ensuring no native-only dependencies block web.

Extras I can add
- A GitHub Actions job that builds an Android APK and attaches it as a release artifact on push or tag.
- A second workflow that deploys to Netlify or Firebase automatically.

If you'd like one of those, tell me which and I'll add it.
