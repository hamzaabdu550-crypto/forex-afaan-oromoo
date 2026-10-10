# Forex Afaan Oromoo — Android APK from a phone

This is a Flutter source project with a GitHub Actions workflow that can build an Android APK in the cloud. You do not need a computer, but you do need a GitHub account and internet access.

## Build using only your Android phone

1. Download and extract `Forex_Afaan_Oromoo_Android_Starter.zip` using your phone's Files app.
2. Open https://github.com in Chrome and sign in (or create an account).
3. Create a **new repository** named `forex-afaan-oromoo`. If offered, you may make it public for the easiest setup; do not upload passwords, API keys, or personal data.
4. In the new repository, choose **Add file → Upload files**. Upload the extracted project files and folders, including `lib/main.dart`, `pubspec.yaml`, `.github/workflows/build-apk.yml`, and `README.md`. Make sure `.github` is included; hidden folders may be hidden by your file picker.
5. Commit the files to the `main` branch.
6. Open the repository's **Actions** tab. Choose **Build Android APK** → **Run workflow** if it hasn't started automatically.
7. Wait for the workflow to finish with a green check mark. Open the completed run and find **Artifacts** near the bottom.
8. Download `forex-afaan-oromoo-apk`, extract the downloaded artifact ZIP, and tap `app-release.apk` to install. Android may ask you to allow installs from that source; only allow it for a file you trust.

## What is included

- Four introductory Forex lessons in Afaan Oromoo + English
- Quiz questions and feedback
- A risk-per-trade calculator
- No broker login, no live trading, no real-money transactions

## Important

This is starter source code, not a prebuilt APK. The APK must be built by the cloud workflow first. GitHub Actions has usage limits and may require repository/account settings. Do not enter passwords or payment details into third-party build websites. The app is educational and does not provide financial advice.
