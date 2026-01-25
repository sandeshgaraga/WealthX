# MoneyQuest - Financial Literacy Flutter App

A fully-local, kid-friendly Flutter application designed to teach middle-school students financial literacy through interactive topics, flash cards, and quizzes.

## Features

### 1. **Topic Selection**
- Learn from 5+ financial literacy topics:
  - 💰 Saving Money
  - 📋 Budgeting
  - 🎯 Needs vs Wants
  - 💳 Credit Basics
  - 🎪 Money Goals

### 2. **Flash Cards Mode**
- Simple, intuitive flash card interface
- Tap to reveal term/definition
- Navigate with previous/next buttons
- Progress tracking

### 3. **Quiz Mode**
- Multiple-choice questions per topic
- Immediate feedback: correct/incorrect
- Explanations for every answer
- Earn 5 coins per correct answer
- Streak system (increments on correct, resets on wrong)

### 4. **In-Game Currency System**
- Earn coins from correct quiz answers (5 coins per question)
- Coins persist across app sessions
- Use coins to purchase cosmetic items in the shop

### 5. **In-App Shop**
- Purchase themes, icons, and color packs
- All items are cosmetic (20 coins each)
- Once purchased, items stay unlocked permanently
- Apply purchased themes immediately

### 6. **Streak System**
- Track consecutive correct answers
- Displayed in app bar with 🔥 icon
- Resets to 0 on wrong answer
- Saved locally and persists across sessions

### 7. **Theme System**
- 4 built-in themes: Default, Neon, Dark, Pastel
- Switch themes anytime from the shop
- Theme preference saved locally

### 8. **Local-Only Storage**
- No backend, no server, no external APIs
- Uses `shared_preferences` for local data storage
- Stores: coins, streak, purchased items, active theme, last played date
- Works completely offline

---

## Project Structure

```
lib/
├── main.dart                    # App entry point with Provider setup
├── models/
│   └── models.dart              # All data models (FlashCard, Question, Topic, ShopItem, UserData)
├── data/
│   ├── sample_data.dart         # Topic, flash card, and question data
│   └── shop_data.dart           # Shop items inventory
├── screens/
│   ├── home_screen.dart         # Topic selection and main navigation
│   ├── flashcards_screen.dart   # Flash card learning interface
│   ├── quiz_screen.dart         # Quiz interface with feedback
│   └── shop_screen.dart         # In-app shop
├── services/
│   ├── local_storage_service.dart    # SharedPreferences wrapper
│   ├── user_data_provider.dart       # Global user state (coins, streak, purchases)
│   └── theme_provider.dart           # Theme state management
└── widgets/
    └── common_widgets.dart           # Reusable widgets (buttons, cards, etc.)
```

---

## Technical Stack

- **Framework:** Flutter (latest stable)
- **Language:** Dart
- **State Management:** Provider
- **Local Storage:** shared_preferences
- **UI:** Material Design 3

---

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0              # State management
  shared_preferences: ^2.2.0    # Local storage
  intl: ^0.18.0                 # Internationalization (for date formatting)
```

---

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK (comes with Flutter)
- A code editor (VS Code, Android Studio, etc.)

### Installation & Setup

1. **Clone or download the project**
   ```bash
   cd WealthX
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

   Or specify a device:
   ```bash
   flutter run -d <device_id>
   ```

4. **View available devices**
   ```bash
   flutter devices
   ```

### Building for Release

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web (if enabled):**
```bash
flutter build web --release
```

---

## How to Use the App

### 1. **Home Screen**
- Select a topic by tapping its card
- Choose "Flash Cards 📚" or "Quiz 🎯"
- Tap the "Shop" button to purchase items

### 2. **Flash Cards**
- Tap the card to reveal the term/definition
- Use "Previous" and "Next" to navigate
- All cards are stored locally

### 3. **Quiz**
- Select an answer (you can only choose once per question)
- Get immediate feedback (correct/incorrect)
- Read the explanation
- Earn 5 coins for correct answers
- Streak increases for correct answers, resets for wrong ones
- See final score and performance feedback

### 4. **Shop**
- Filter by category: All, Themes, Icons, Colors
- Tap "Buy" to purchase (costs 20 coins)
- For themes, the app automatically applies the theme after purchase
- Tap "Select" to switch between purchased themes
- All items unlock permanently once purchased

### 5. **Coin Earning**
- Earn 5 coins per correct quiz answer
- Coins display in the app bar (💰 icon)
- Check streak progress (🔥 icon)

### 6. **Data Persistence**
- All progress saves automatically to device
- Close and reopen the app anytime - your data is there
- Coins, streak, purchases, and theme preference all persist

---

## Data Storage Details

### What Gets Saved Locally
- **Coins:** Total earned coins
- **Streak:** Current correct answer streak
- **Purchased Items:** List of all purchased cosmetic items
- **Active Theme:** Currently selected theme
- **Last Played Date:** When the user last used the app

### Storage Location
- **Android:** App's internal data directory (SharedPreferences)
- **iOS:** App's library/preferences directory
- **Web:** Browser's LocalStorage

---

## Customization Guide

### Adding More Topics

Edit `lib/data/sample_data.dart`:

```dart
Topic(
  id: 'your_topic_id',
  title: 'Your Topic Title',
  description: 'Your description',
  icon: '🎯',  // Any emoji
  flashCards: [
    FlashCard(
      id: 'card_1',
      term: 'Term',
      definition: 'Definition',
    ),
    // Add more cards...
  ],
  questions: [
    Question(
      id: 'q1',
      question: 'Your question?',
      options: ['Option A', 'Option B', 'Option C', 'Option D'],
      correctAnswerIndex: 0,  // Index of correct answer
      explanation: 'Why this is correct...',
    ),
    // Add more questions...
  ],
),
```

### Adding More Shop Items

Edit `lib/data/shop_data.dart`:

```dart
ShopItem(
  id: 'unique_id',
  name: 'Item Name',
  description: 'Item description',
  cost: 20,  // Coins
  type: 'theme',  // or 'icon', 'colorpack'
),
```

### Adding New Themes

Edit `lib/services/theme_provider.dart`:

```dart
static ThemeData yourTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.yourColor,
  ),
  // ... customize colors, fonts, etc.
);

static ThemeData getTheme(String themeName) {
  switch (themeName.toLowerCase()) {
    case 'yourtheme':
      return yourTheme;
    // ...
  }
}
```

---

## Troubleshooting

### App won't run
1. Ensure Flutter is installed: `flutter --version`
2. Run `flutter pub get`
3. Check for errors: `flutter doctor`

### Data not persisting
1. Check that `shared_preferences` is installed: `flutter pub get`
2. Clear app data and restart
3. Ensure you're saving data through `UserDataProvider`

### Theme not changing
1. Verify shop item IDs start with `theme_`
2. Check `ThemeProvider.getAvailableThemes()` includes your theme name
3. Clear app cache and restart

### Performance issues
1. Reduce animation durations if devices are slow
2. Check that no infinite loops exist in `build()` methods
3. Consider adding `const` constructors to widgets

---

## File-by-File Explanation

| File | Purpose |
|------|---------|
| `main.dart` | App initialization, Provider setup, theme configuration |
| `models.dart` | Data classes for Questions, FlashCards, Topics, UserData, ShopItems |
| `sample_data.dart` | Pre-loaded topics, flash cards, and quiz questions |
| `shop_data.dart` | Shop item inventory |
| `local_storage_service.dart` | Wrapper around SharedPreferences for data persistence |
| `user_data_provider.dart` | Global state management for user progress (coins, streak, purchases) |
| `theme_provider.dart` | Global state for app theme |
| `common_widgets.dart` | Reusable UI components (buttons, cards, flash cards, etc.) |
| `home_screen.dart` | Topic selection and main navigation |
| `flashcards_screen.dart` | Flash card learning interface |
| `quiz_screen.dart` | Quiz gameplay and feedback |
| `shop_screen.dart` | In-app cosmetic shop |

---

## Key Features Implementation

### Streak System
- Increments when user answers correctly
- Resets to 0 on incorrect answer
- Saved to device automatically
- Displayed in app bar with fire emoji (🔥)

### Coin System
- +5 coins per correct quiz answer
- Used to purchase cosmetic items (20 coins each)
- Persists across app sessions
- Displayed in app bar with money emoji (💰)

### Local Storage Only
- No backend servers needed
- No API calls
- All data stays on user's device
- Works completely offline
- Uses SharedPreferences for reliability

---

## Future Enhancement Ideas

- Leaderboards (local only)
- Achievement badges
- Daily challenges
- Timed quizzes
- Progress charts
- Import/export data
- Sound effects and animations
- Difficulty levels
- Categories within topics

---

## License

This project is open-source and available for educational use.

---

## Support

For issues or questions:
1. Check the Troubleshooting section above
2. Review the code comments
3. Verify all dependencies are installed
4. Ensure Flutter environment is properly set up

---

## Version History

**v1.0.0** (December 2025)
- Initial release
- 5 topics with flash cards and quizzes
- In-game currency system
- Theme shop
- Streak tracking
- 4 built-in themes
- Full local data persistence

---

**Happy Learning! 🎓💰**
