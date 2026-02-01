---
name: build-android
description: Build Android APK with Expo, install on device, and launch for testing
---

## Steps

1. Export the Expo bundle:
   ```bash
   npx expo export --platform android
   ```

2. Build the release APK:
   ```bash
   cd android && ./gradlew assembleRelease
   ```

3. Install on connected device:
   ```bash
   adb install -r app/build/outputs/apk/release/app-release.apk
   ```

4. Launch the app:
   ```bash
   adb shell monkey -p <package-name> -c android.intent.category.LAUNCHER 1
   ```

5. Wait for user to confirm the build works before proceeding

## On Failure
- If export fails: Check for TypeScript errors, run `npx tsc --noEmit`
- If gradle fails: Check `android/app/build.gradle` for issues
- If install fails: Check device is connected with `adb devices`
