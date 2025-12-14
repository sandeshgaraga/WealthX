# MoneyQuest - Quick Start Guide

## ⚡ 30-Second Setup

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Run the App
```bash
flutter run
```

That's it! The app should launch on your connected device or emulator.

---

## 🚀 First Time Setup (Detailed)

### Prerequisites Checklist
- [ ] Flutter SDK installed ([Install Flutter](https://flutter.dev/docs/get-started/install))
- [ ] Connected device or emulator running
- [ ] VS Code, Android Studio, or your preferred IDE

### Step 1: Install Dependencies
```bash
cd "path/to/WealthX"
flutter pub get
```

**What this does:**
- Downloads `provider`, `shared_preferences`, and other dependencies
- Creates `pubspec.lock` file
- Sets up the project

### Step 2: Check Connected Devices
```bash
flutter devices
```

**Expected output:**
```
2 connected devices:
Pixel 5 (mobile)    • emulator-5554 • android-x86    • Android 11
Chrome (web)        • chrome        • web            • web
```

### Step 3: Run the App
```bash
flutter run
```

**Options:**
- Run on default device: `flutter run`
- Run on specific device: `flutter run -d emulator-5554`
- Run in verbose mode: `flutter run -v` (shows detailed logs)
- Run with release mode: `flutter run --release`

---

## 📱 Running on Different Platforms

### Android (Physical Device or Emulator)
```bash
# Connected via USB with USB debugging enabled
flutter run

# Or specify emulator
flutter run -d emulator-5554
```

### iOS (Mac only)
```bash
flutter run -d "iPhone 13"
```

### Web (Chrome required)
```bash
flutter run -d chrome
```

---

## 🛠 Development Commands

### Build Configurations

**Debug Build (fastest, for development)**
```bash
flutter run --debug
```

**Release Build (optimized, for distribution)**
```bash
flutter run --release
```

**Profile Build (for performance analysis)**
```bash
flutter run --profile
```

### Clean & Rebuild
```bash
# Clean all build artifacts
flutter clean

# Rebuild the project
flutter pub get
flutter run
```

### Code Generation & Formatting
```bash
# Format all Dart files
dart format lib/

# Analyze code for issues
flutter analyze
```

---

## 📦 Building for Distribution

### Android APK (for Google Play or sideloading)
```bash
# Debug APK
flutter build apk --debug

# Release APK (recommended)
flutter build apk --release

# Split APK by architecture (smaller file sizes)
flutter build apk --split-per-abi --release
```

Output: `build/app/outputs/apk/release/app-release.apk`

### iOS App (Mac only, for App Store)
```bash
# Build for deployment
flutter build ios --release

# Then open Xcode to submit to App Store
open ios/Runner.xcworkspace
```

### Web (for browser)
```bash
flutter build web --release
```

Output: `build/web/`

---

## 🐛 Troubleshooting

### Problem: "Flutter not found"
**Solution:**
1. Verify Flutter installation: `flutter --version`
2. Add Flutter to PATH ([Guide](https://flutter.dev/docs/get-started/install))
3. Restart your terminal

### Problem: "No devices found"
**Solution:**
1. Android: Enable USB debugging, connect device, and run `flutter devices`
2. Emulator: Start Android emulator from Android Studio
3. Web: Ensure Chrome is installed

### Problem: "Dependencies not installing"
**Solution:**
```bash
flutter clean
flutter pub get
flutter pub upgrade
```

### Problem: "App crashes on startup"
**Solution:**
1. Check logs: `flutter run -v`
2. Verify dependencies: `flutter pub get`
3. Rebuild: `flutter clean && flutter run`

### Problem: "Data not persisting"
**Solution:**
1. Ensure `shared_preferences` is listed in `pubspec.yaml`
2. For Android: Check app has storage permissions
3. For iOS: Check app has necessary entitlements
4. Clear app data and restart

---

## 🎮 Testing the App Features

### Testing Checklist

**1. Home Screen**
- [ ] See 5 topics displayed
- [ ] Each topic shows icon, title, description
- [ ] Tap topic opens bottom sheet with options

**2. Flash Cards**
- [ ] Flash cards load for selected topic
- [ ] Tap card toggles term/definition
- [ ] Previous/Next buttons work
- [ ] Progress bar updates

**3. Quiz**
- [ ] Multiple-choice questions display
- [ ] Can select only one answer
- [ ] Feedback dialog shows after answering
- [ ] Correct answers give +5 coins
- [ ] Wrong answers reset streak

**4. Coins & Streak**
- [ ] Coins increase after correct quiz answers
- [ ] Streak increases on correct, resets on wrong
- [ ] Values display in app bar
- [ ] Persists when app is closed

**5. Shop**
- [ ] All items display with prices
- [ ] Can't buy without enough coins
- [ ] Purchase removes coins and shows "Owned"
- [ ] Themes can be selected and applied
- [ ] Theme persists on app restart

**6. Data Persistence**
- [ ] Close and reopen app
- [ ] Coins are still there
- [ ] Streak value preserved
- [ ] Purchased items still show as owned
- [ ] Active theme is applied

---

## 📊 Project File Structure Reference

```
WealthX/
├── pubspec.yaml                 ← Dependencies & project config
├── README.md                    ← Full documentation
├── QUICKSTART.md               ← This file
├── setup.sh / setup.bat        ← Automated setup scripts
│
├── android/                    ← Android platform code
│   ├── app/
│   │   ├── build.gradle
│   │   └── src/main/
│   │       ├── AndroidManifest.xml
│   │       └── kotlin/.../MainActivity.kt
│   ├── build.gradle
│   └── gradle.properties
│
├── ios/                        ← iOS platform code
│   └── Runner/
│       └── GeneratedPluginRegistrant.m
│
└── lib/                        ← Flutter source code
    ├── main.dart               ← App entry point
    ├── models/
    │   └── models.dart         ← Data models
    ├── data/
    │   ├── sample_data.dart    ← Topics & questions
    │   └── shop_data.dart      ← Shop items
    ├── screens/
    │   ├── home_screen.dart
    │   ├── flashcards_screen.dart
    │   ├── quiz_screen.dart
    │   └── shop_screen.dart
    ├── services/
    │   ├── local_storage_service.dart
    │   ├── user_data_provider.dart
    │   └── theme_provider.dart
    └── widgets/
        └── common_widgets.dart ← Reusable UI components
```

---

## 🎓 Learning Resources

- **Flutter Official Docs:** https://flutter.dev/docs
- **Dart Language Guide:** https://dart.dev/guides
- **Material Design 3:** https://m3.material.io/
- **Provider Package:** https://pub.dev/packages/provider
- **SharedPreferences:** https://pub.dev/packages/shared_preferences

---

## 💡 Tips for Development

1. **Use Hot Reload**: Press `R` during `flutter run` to quickly reload changes
2. **Use Hot Restart**: Press `Shift+R` to restart the app (rebuilds Dart VM)
3. **Enable Flutter DevTools**: `flutter pub global activate devtools` then `devtools`
4. **Check for Errors**: Run `flutter analyze` regularly
5. **Format Code**: `dart format lib/` keeps code clean

---

## 📞 Getting Help

If something isn't working:

1. **Read the full README.md** - has detailed explanations
2. **Check flutter doctor** - `flutter doctor -v`
3. **Search Flutter issues** - https://github.com/flutter/flutter/issues
4. **Check package docs** - https://pub.dev/packages/provider

---

## ✅ You're Ready!

Your MoneyQuest app is ready to use! 🎉

```bash
flutter run
```

**Have fun learning financial literacy!** 💰🎓

---

**Last Updated:** December 2025
**Version:** 1.0.0
