# MoneyQuest - File Manifest & Directory Structure

## 📂 Complete Project Structure

```
WealthX/
│
├── 📄 pubspec.yaml                    # Flutter project configuration & dependencies
├── 📄 README.md                       # Main documentation & feature overview
├── 📄 QUICKSTART.md                   # Quick setup and running guide
├── 📄 FEATURES.md                     # Detailed feature documentation
├── 📄 BUILD_DEPLOY.md                 # Build and deployment instructions
├── 📄 IMPLEMENTATION_SUMMARY.md        # This implementation summary
├── 📄 setup.sh                        # Bash setup script (Linux/Mac)
├── 📄 setup.bat                       # Batch setup script (Windows)
│
├── 📁 android/
│   ├── 📁 app/
│   │   ├── 📄 build.gradle            # Android app build configuration
│   │   └── 📁 src/main/
│   │       ├── 📄 AndroidManifest.xml # Android app manifest
│   │       └── 📁 kotlin/
│   │           └── 📁 com/example/money_quest/
│   │               └── 📄 MainActivity.kt # Android entry point
│   ├── 📄 build.gradle                # Android project build config
│   ├── 📄 gradle.properties           # Gradle properties
│   └── 📁 .idea/                      # IDE configuration
│
├── 📁 ios/
│   ├── 📁 Runner/
│   │   ├── 📄 GeneratedPluginRegistrant.m   # iOS plugin registry
│   │   └── 📄 GeneratedPluginRegistrant.h   # iOS header file
│   └── 📁 Runner.xcworkspace/
│       └── 📄 contents.xcworkspacedata      # Xcode workspace config
│
└── 📁 lib/                            # Main Flutter source code
    ├── 📄 main.dart                   # App entry point & configuration
    │
    ├── 📁 models/
    │   └── 📄 models.dart             # Data models:
    │                                  #  - FlashCard
    │                                  #  - Question
    │                                  #  - Topic
    │                                  #  - ShopItem
    │                                  #  - UserData
    │
    ├── 📁 data/
    │   ├── 📄 sample_data.dart        # Topic, flashcard, question data
    │   │                              # 5 topics, 20 flashcards, 25 questions
    │   └── 📄 shop_data.dart          # Shop items inventory (8 items)
    │
    ├── 📁 screens/
    │   ├── 📄 home_screen.dart        # Topic selection and main navigation
    │   ├── 📄 flashcards_screen.dart  # Flash card learning interface
    │   ├── 📄 quiz_screen.dart        # Quiz gameplay with feedback
    │   └── 📄 shop_screen.dart        # In-app shop and purchases
    │
    ├── 📁 services/
    │   ├── 📄 local_storage_service.dart  # SharedPreferences wrapper
    │   │                                  # Handles: coins, streak, items,
    │   │                                  # theme, last played date
    │   ├── 📄 user_data_provider.dart     # Global state provider (Provider)
    │   │                                  # Manages: coins, streak, purchases
    │   └── 📄 theme_provider.dart         # Theme state management
    │                                      # 4 themes: default, neon, dark, pastel
    │
    └── 📁 widgets/
        └── 📄 common_widgets.dart     # Reusable UI components:
                                        #  - MoneyQuestAppBar
                                        #  - RoundedButton
                                        #  - MoneyQuestCard
                                        #  - FlashCardWidget
                                        #  - QuestionWidget
                                        #  - FeedbackWidget
                                        #  - LoadingWidget
```

---

## 📋 File Descriptions

### Root Level Files

| File | Size | Purpose | Read Time |
|------|------|---------|-----------|
| `pubspec.yaml` | 1 KB | Dependencies and Flutter config | 2 min |
| `README.md` | 15 KB | Complete feature documentation | 10 min |
| `QUICKSTART.md` | 12 KB | Quick setup guide | 5 min |
| `FEATURES.md` | 18 KB | Detailed feature overview | 10 min |
| `BUILD_DEPLOY.md` | 14 KB | Build and deployment guide | 8 min |
| `IMPLEMENTATION_SUMMARY.md` | 10 KB | Implementation summary | 5 min |
| `setup.sh` | 0.5 KB | Linux/Mac setup script | N/A |
| `setup.bat` | 0.5 KB | Windows setup script | N/A |

### Source Code Files (lib/)

#### Main Entry Point
| File | Lines | Purpose |
|------|-------|---------|
| `main.dart` | ~60 | App initialization, Provider setup, app configuration |

#### Models (lib/models/)
| File | Lines | Purpose |
|------|-------|---------|
| `models.dart` | ~95 | 5 data models: FlashCard, Question, Topic, ShopItem, UserData |

#### Data (lib/data/)
| File | Lines | Purpose |
|------|-------|---------|
| `sample_data.dart` | ~350 | 5 topics, 20 flashcards, 25 quiz questions |
| `shop_data.dart` | ~45 | 8 purchasable items (themes, icons, colors) |

#### Screens (lib/screens/)
| File | Lines | Purpose |
|------|-------|---------|
| `home_screen.dart` | ~180 | Topic selection, bottom sheet modals |
| `flashcards_screen.dart` | ~140 | Flash card UI, navigation, progress |
| `quiz_screen.dart` | ~170 | Quiz gameplay, feedback, scoring |
| `shop_screen.dart` | ~270 | Shop UI, purchases, theme selection |

#### Services (lib/services/)
| File | Lines | Purpose |
|------|-------|---------|
| `local_storage_service.dart` | ~80 | SharedPreferences wrapper for persistence |
| `user_data_provider.dart` | ~130 | Global state manager using Provider |
| `theme_provider.dart` | ~190 | Theme system with 4 themes |

#### Widgets (lib/widgets/)
| File | Lines | Purpose |
|------|-------|---------|
| `common_widgets.dart` | ~350 | 7 reusable UI components |

---

## 🔗 Dependencies & Imports

### Flutter Core
- `flutter/material.dart` - Material Design UI
- `flutter/foundation.dart` - Core functionality

### State Management
- `provider: ^6.0.0` - Global state management
  - Used in: all screens, main.dart
  - Provides: UserDataProvider, ThemeProvider

### Local Storage
- `shared_preferences: ^2.2.0` - Device-local key-value storage
  - Used in: local_storage_service.dart
  - Stores: coins, streak, purchases, theme

### Internationalization (optional)
- `intl: ^0.18.0` - Internationalization support
  - Used in: future localization support
  - Currently: not actively used

---

## 📊 Code Statistics

### Total Lines of Code
- **Dart Source Code:** ~2,000+ lines
- **Documentation:** ~3,000+ lines
- **Configuration:** ~200+ lines
- **Total:** ~5,200+ lines

### File Distribution
- **Screens:** 4 files, ~760 lines
- **Services:** 3 files, ~400 lines
- **Models:** 1 file, ~95 lines
- **Data:** 2 files, ~395 lines
- **Widgets:** 1 file, ~350 lines
- **Main:** 1 file, ~60 lines
- **Total Lib:** ~2,060 lines

### Widget Count
- Custom Widgets: 7
- Screens: 4
- State Providers: 2
- Models: 5

---

## 📝 Code Comments & Documentation

All source files include:
- ✅ File-level documentation (what the file does)
- ✅ Class-level documentation (what each class does)
- ✅ Method-level documentation (what each method does)
- ✅ Complex logic explanation (why something is done)
- ✅ Section headers (organizing related code)

**Documentation Coverage:** ~30% of code is comments

---

## 🔄 File Dependencies (Import Graph)

```
main.dart
├── models.dart
├── screens/home_screen.dart
├── services/local_storage_service.dart
├── services/user_data_provider.dart
└── services/theme_provider.dart

screens/home_screen.dart
├── data/sample_data.dart
├── models.dart
├── services/user_data_provider.dart
└── widgets/common_widgets.dart

screens/flashcards_screen.dart
├── models.dart
├── services/user_data_provider.dart
└── widgets/common_widgets.dart

screens/quiz_screen.dart
├── models.dart
├── services/user_data_provider.dart
└── widgets/common_widgets.dart

screens/shop_screen.dart
├── data/shop_data.dart
├── models.dart
├── services/user_data_provider.dart
├── services/theme_provider.dart
└── widgets/common_widgets.dart

services/user_data_provider.dart
├── models.dart
└── services/local_storage_service.dart

services/theme_provider.dart
└── (no local imports)

widgets/common_widgets.dart
├── models.dart
└── (Flutter packages)
```

---

## 🎯 Key Files for Customization

### To Add Topics
**Edit:** `lib/data/sample_data.dart`
- Add new `Topic` object
- Include flashcards and questions
- ~50-100 lines per topic

### To Add Shop Items
**Edit:** `lib/data/shop_data.dart`
- Add new `ShopItem` object
- ~5 lines per item

### To Add Themes
**Edit:** `lib/services/theme_provider.dart`
- Define new `ThemeData`
- Add to `getTheme()` method
- ~20-40 lines per theme

### To Add Features
**Create:** New files in appropriate folder
- Screens: `lib/screens/new_screen.dart`
- Services: `lib/services/new_service.dart`
- Widgets: `lib/widgets/new_widgets.dart`

---

## 🔐 Security & Data Files

### Sensitive Data
❌ No passwords stored  
❌ No API keys in code  
❌ No personal information collected  
✅ All data stored locally on device  

### Data Files
- **Local Only:** SharedPreferences (on-device)
- **No Cloud:** Zero external storage
- **No Sync:** Data stays on device

---

## 📦 Build Artifacts (Generated)

These are created during build, not in source:
- `pubspec.lock` - Dependency lock file
- `.dart_tool/` - Build cache
- `build/` - Build outputs
- `.flutter-plugins` - Plugin metadata

**Don't edit these manually!**

---

## 🚀 File Size Summary

| Category | Size |
|----------|------|
| Source Code (lib/) | ~80 KB |
| Documentation | ~60 KB |
| Android Config | ~20 KB |
| iOS Config | ~5 KB |
| pubspec.yaml | ~1 KB |
| **Total (Source)** | **~166 KB** |
| **Release APK** | ~15-25 MB |
| **App Bundle** | ~10-15 MB |

---

## 📥 What to Commit to Version Control

### Commit to Git
```
✅ lib/                    # All source code
✅ android/               # Android configuration
✅ ios/                   # iOS configuration
✅ pubspec.yaml          # Dependencies
✅ README.md             # Documentation
✅ QUICKSTART.md         # Setup guide
✅ .gitignore           # Git ignore file
```

### Do NOT Commit
```
❌ build/                 # Build artifacts
❌ .dart_tool/           # Build cache
❌ pubspec.lock          # Lock file
❌ .flutter-plugins      # Plugin metadata
```

---

## 🔍 File Navigation Tips

### To Find...
| Looking For | Location |
|-------------|----------|
| App entry point | `lib/main.dart` |
| Data models | `lib/models/models.dart` |
| Quiz questions | `lib/data/sample_data.dart` |
| Shop items | `lib/data/shop_data.dart` |
| Home screen | `lib/screens/home_screen.dart` |
| Quiz gameplay | `lib/screens/quiz_screen.dart` |
| Coin system | `lib/services/user_data_provider.dart` |
| Local storage | `lib/services/local_storage_service.dart` |
| Themes | `lib/services/theme_provider.dart` |
| UI components | `lib/widgets/common_widgets.dart` |

---

## 📋 File Checklist

### Essential Files (Must Have)
- ✅ `pubspec.yaml`
- ✅ `lib/main.dart`
- ✅ `lib/models/models.dart`
- ✅ `lib/data/sample_data.dart`
- ✅ `lib/screens/` (all 4 screens)
- ✅ `lib/services/` (all 3 services)
- ✅ `lib/widgets/common_widgets.dart`

### Documentation (Highly Recommended)
- ✅ `README.md`
- ✅ `QUICKSTART.md`
- ✅ `FEATURES.md`
- ✅ `BUILD_DEPLOY.md`

### Configuration (Required for Build)
- ✅ `android/`
- ✅ `ios/`
- ✅ `pubspec.yaml`

---

## 🎓 Learning Resources by File

### Understanding the App Architecture
1. Read: `README.md` - Overview
2. Read: `lib/main.dart` - Entry point
3. Read: `lib/services/user_data_provider.dart` - State
4. Read: `lib/screens/home_screen.dart` - Navigation

### Understanding a Feature
1. **Coins:** See `lib/services/user_data_provider.dart`
2. **Themes:** See `lib/services/theme_provider.dart`
3. **Quiz:** See `lib/screens/quiz_screen.dart`
4. **Storage:** See `lib/services/local_storage_service.dart`

### Modifying Content
1. **Add topics:** Edit `lib/data/sample_data.dart`
2. **Add items:** Edit `lib/data/shop_data.dart`
3. **Add themes:** Edit `lib/services/theme_provider.dart`

---

## ✅ Quality Assurance Checklist

- ✅ All files present
- ✅ No circular dependencies
- ✅ Proper import statements
- ✅ Code is well-commented
- ✅ Consistent naming conventions
- ✅ No unused variables
- ✅ No hardcoded secrets
- ✅ Proper error handling
- ✅ Consistent formatting

---

## 📞 File-Related Questions?

### "Where do I...?"
- **Add a topic?** → `lib/data/sample_data.dart`
- **Change colors?** → `lib/services/theme_provider.dart`
- **Add a screen?** → Create in `lib/screens/`
- **Add UI component?** → Add to `lib/widgets/common_widgets.dart`
- **Change coin reward?** → `lib/screens/quiz_screen.dart`
- **Modify storage?** → `lib/services/local_storage_service.dart`

### "How do I...?"
- **Run the app?** → `flutter run`
- **Build APK?** → `flutter build apk --release`
- **Add dependency?** → Edit `pubspec.yaml`, then `flutter pub get`
- **Update file?** → Edit file, then hot-reload (`R`)

---

**Version:** 1.0.0  
**Last Updated:** December 2025  
**Status:** ✅ Production Ready
