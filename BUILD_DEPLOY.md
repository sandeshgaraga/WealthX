# MoneyQuest - Build & Deployment Guide

## 🏗️ Building the App

### Prerequisites
- Flutter SDK installed
- Dependencies installed: `flutter pub get`
- Android SDK or Xcode installed (depending on target platform)

---

## 📱 Android Build Guide

### Debug Build (Testing)
```bash
flutter build apk --debug
```
**Output:** `build/app/outputs/apk/debug/app-debug.apk`
**Use:** Testing on devices, development builds

### Release Build (Distribution)
```bash
flutter build apk --release
```
**Output:** `build/app/outputs/apk/release/app-release.apk`
**Use:** Publishing to Google Play, distributing to users

### Release Build with Split APK (Recommended for Google Play)
```bash
flutter build apk --split-per-abi --release
```
**Outputs:**
- `app-arm64-v8a-release.apk` (64-bit ARM)
- `app-armeabi-v7a-release.apk` (32-bit ARM)
- `app-x86_64-release.apk` (Intel 64-bit)

**Benefits:** Smaller file sizes, faster downloads

### App Bundle (Required for Google Play)
```bash
flutter build appbundle --release
```
**Output:** `build/app/outputs/bundle/release/app-release.aab`
**Use:** Required for Google Play Store distribution

### Signing Release APK (Production)

1. **Create signing key (first time only):**
```bash
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

2. **Build with signing:**
```bash
flutter build apk --release --split-per-abi
```

3. **Manually sign APK:**
```bash
jarsigner -verbose -sigalg MD5withRSA -digestalg SHA1 -keystore ~/key.jks \
  build/app/outputs/apk/release/app-arm64-v8a-release.apk upload
```

---

## 🍎 iOS Build Guide (Mac only)

### Debug Build
```bash
flutter build ios --debug
```
**Output:** `build/ios/iphoneos/Runner.app`

### Release Build
```bash
flutter build ios --release
```
**Output:** `build/ios/iphoneos/Runner.app`

### Build for App Store
```bash
flutter build ios --release --no-codesign
```

Then, in Xcode:
```bash
open ios/Runner.xcworkspace
```

Steps in Xcode:
1. Product → Scheme → Runner
2. Product → Destination → Generic iOS Device
3. Product → Archive
4. Upload to App Store Connect

### Build Troubleshooting

**Problem:** "Code signing identity not found"
```bash
open ios/Runner.xcworkspace
# Configure signing in Xcode
```

**Problem:** "Pod install fails"
```bash
cd ios
pod install
cd ..
flutter run
```

---

## 🌐 Web Build Guide

### Build for Web
```bash
flutter build web --release
```
**Output:** `build/web/`

### Deploy to Web Server

**Firebase Hosting:**
```bash
npm install -g firebase-tools
firebase login
firebase init hosting
# Choose 'build/web' as public directory
flutter build web --release
firebase deploy
```

**Netlify:**
```bash
npm install -g netlify-cli
netlify login
flutter build web --release
netlify deploy --prod --dir build/web
```

**Traditional Server (nginx):**
```bash
# Copy build/web contents to server /var/www/html/
rsync -avz build/web/ user@server:/var/www/html/
```

---

## 🔍 Build Size Optimization

### Android APK Size Reduction
```bash
# Remove unused code
flutter build apk --split-per-abi --release

# Analyze APK size
flutter pub get
flutter pub upgrade
```

### Expected Sizes
- Debug APK: ~50-70 MB
- Release APK: ~15-25 MB
- App Bundle: ~10-15 MB

---

## 🧪 Testing Before Distribution

### Pre-Release Checklist
- [ ] Test on actual devices (Android & iOS if applicable)
- [ ] Run `flutter analyze` - no errors
- [ ] Run `flutter test` if tests exist
- [ ] Check all features:
  - [ ] Topics load correctly
  - [ ] Flash cards work
  - [ ] Quiz functions properly
  - [ ] Coins reward correctly
  - [ ] Streak resets on wrong answer
  - [ ] Shop purchases work
  - [ ] Themes apply correctly
  - [ ] Data persists after app close
- [ ] Test across different screen sizes
- [ ] Test on different Android versions
- [ ] Verify no crashes in logs

### Manual Testing Commands
```bash
# Run with verbose logging
flutter run -v

# Run in release mode
flutter run --release

# Run performance profiling
flutter run --profile
```

---

## 📊 Monitoring & Analytics (Optional)

### Enable Crash Reporting (Firebase)

1. **Install Firebase plugins:**
```bash
flutter pub add firebase_core firebase_crashlytics
```

2. **Initialize in main.dart:**
```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MoneyQuestApp(...));
}
```

3. **Configure in each platform**
   - Android: Add `google-services.json`
   - iOS: Add `GoogleService-Info.plist`

---

## 📦 Distribution Platforms

### Google Play Store

**Steps:**
1. Create Google Play Developer account ($25 one-time)
2. Build app bundle: `flutter build appbundle --release`
3. Create app listing in Google Play Console
4. Upload signed AAB file
5. Fill in app details, screenshots, description
6. Submit for review (typically 1-3 hours)

**Minimum Requirements:**
- Target Android 12 (API level 31) or higher
- 64-bit support
- Privacy policy URL

### Apple App Store (iOS)

**Steps:**
1. Enroll in Apple Developer Program ($99/year)
2. Create app certificate in Xcode
3. Build for App Store: `flutter build ios --release`
4. Upload via Xcode or Application Loader
5. Submit app for review

**Minimum Requirements:**
- iOS 11.0 or higher
- Complete app information
- 1024x1024 app icon
- Screenshots for all screen sizes

### Alternative Distribution

**Amazon Appstore:**
```bash
flutter build apk --release
# Upload to Amazon Appstore Console
```

**Samsung Galaxy Store:**
```bash
flutter build apk --release
# Upload to Samsung Galaxy Store
```

**Sideload (Direct Distribution):**
```bash
flutter build apk --release
# Share APK directly
```

---

## 🔐 Security Checklist

- [ ] No hardcoded secrets or API keys
- [ ] All data stored locally (✅ this app)
- [ ] No sensitive data in logs
- [ ] Use HTTPS if any network calls
- [ ] Validate all user inputs
- [ ] Keep dependencies updated: `flutter pub upgrade`

---

## 📈 Post-Release Monitoring

### Monitor App Performance
1. **Google Play Console:** View crashes, ANRs (Android Not Responding)
2. **App Store Analytics:** View crash reports
3. **Firebase Console:** Real-time crash reporting

### Collect User Feedback
- In-app rating prompts
- Beta testing groups
- User reviews and ratings

### Version Updates

**Minor Update (bug fixes):**
```bash
# Edit version in pubspec.yaml
# version: 1.0.1+2

flutter build apk --release
# Resubmit to store
```

**Major Update (new features):**
```bash
# Edit version in pubspec.yaml
# version: 1.1.0+3

flutter build apk --release
# Test thoroughly before release
```

---

## 🐛 Troubleshooting Builds

### General Issues

**"Build failed" - Check logs:**
```bash
flutter clean
flutter pub get
flutter build apk --verbose
```

**"Out of memory during build":**
```bash
# Increase Java heap size
export JAVA_OPTS="-Xmx4g"
flutter build apk --release
```

### Android Issues

**"SDK version too low":**
- Edit `android/app/build.gradle`
- Increase `compileSdkVersion` to 34+

**"Permission denied during signing":**
```bash
chmod 600 ~/key.jks
# Retry build
```

### iOS Issues

**"Provisioning profile not found":**
- Open `ios/Runner.xcworkspace` in Xcode
- Go to Signing & Capabilities
- Select correct team

**"Pod install fails":**
```bash
cd ios
rm -rf Pods
pod install
cd ..
flutter run
```

---

## 📋 Release Checklist

### Before Release
- [ ] Version updated in `pubspec.yaml`
- [ ] README updated with changelog
- [ ] All features tested
- [ ] No console errors in debug mode
- [ ] `flutter analyze` passes
- [ ] App icon is 1024x1024 (App Store requirement)
- [ ] Screenshots prepared (minimum 2)
- [ ] Description and keywords ready
- [ ] Privacy policy written
- [ ] Rate limit or terms of service (if applicable)

### After Release
- [ ] Monitor crash reports
- [ ] Check user reviews
- [ ] Plan next feature update
- [ ] Keep Flutter/dependencies updated

---

## 📞 Support & Help

- **Flutter Docs:** https://flutter.dev/docs
- **Android Build:** https://developer.android.com/build
- **iOS Build:** https://developer.apple.com/xcode/
- **Google Play:** https://play.google.com/console
- **App Store:** https://appstoreconnect.apple.com

---

**Version:** 1.0.0
**Last Updated:** December 2025
