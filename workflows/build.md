---
auto_execution_mode: 0
description: Build Android APK with Expo, install on device, and launch for testing
---
Build and deploy the app to a connected Android device.

## Steps

1. **Export Expo bundle**
   ```bash
   npx expo export --platform android
   ```

2. **Build release APK**
   ```bash
   cd android && ./gradlew assembleRelease
   ```

3. **Install on device**
   ```bash
   adb install -r app/build/outputs/apk/release/app-release.apk
   ```

4. **Launch app**
   ```bash
   adb shell monkey -p <package-name> -c android.intent.category.LAUNCHER 1
   ```

5. **Wait for confirmation**
   - Ask user to confirm the build works
   - Do not proceed until confirmed

## On Failure
- If export fails: Check for TypeScript errors with `npx tsc --noEmit`
- If gradle fails: Check `android/app/build.gradle`
- If install fails: Verify device connection with `adb devices`
