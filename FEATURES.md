# MoneyQuest - Feature Overview & Documentation

## 🎯 Core Features Summary

### 1. **📚 Learning Topics**
- 5 comprehensive financial literacy topics
- Each topic includes flash cards and quiz questions
- Topics: Saving, Budgeting, Needs vs Wants, Credit Basics, Money Goals

### 2. **🎴 Flash Cards Mode**
- Interactive term/definition cards
- Tap to reveal/hide content
- Progress tracking (X of Y cards)
- Easy navigation with Previous/Next buttons
- No coin rewards - pure learning

### 3. **🧠 Quiz Mode**
- 5 multiple-choice questions per topic
- Select one answer and get instant feedback
- Detailed explanation for each question
- **Rewards:**
  - ✅ Correct: +5 coins, +1 streak
  - ❌ Wrong: +0 coins, streak resets to 0
- Final score with performance feedback

### 4. **💰 Coin System**
- Earn 5 coins per correct quiz answer
- Use coins to purchase cosmetic items
- Coins persist across app sessions
- Coins display in app bar (💰 icon)
- Economy: 20 coins per shop item

### 5. **🔥 Streak System**
- Counts consecutive correct quiz answers
- Increments only on correct answers
- Resets to 0 on wrong answer
- Displays in app bar (🔥 icon)
- Saved locally and persists

### 6. **🛍️ In-App Shop**
- Purchase cosmetic themes, icons, and color packs
- Each item costs 20 coins
- All items are permanent (one-time purchase)
- Purchased items are unlockable, not consumable
- Filter by category: All, Themes, Icons, Colors

### 7. **🎨 Theme System**
- 4 built-in themes: Default, Neon, Dark, Pastel
- Switch themes anytime from shop
- Apply theme changes instantly
- Theme preference saves locally
- Each theme has unique colors and styling

### 8. **💾 Local Data Storage**
- **No backend, no servers, no internet required**
- Uses SharedPreferences for reliable local storage
- Stored data:
  - Total coins
  - Current streak
  - List of purchased items
  - Active theme preference
  - Last played date (optional)
- Works completely offline

---

## 📊 Data Model Overview

### Topic Model
```dart
Topic {
  id: String,                    // Unique identifier
  title: String,                 // Display name
  description: String,           // Short description
  icon: String,                  // Emoji representation
  flashCards: List<FlashCard>,   // Learning cards
  questions: List<Question>      // Quiz questions
}
```

### FlashCard Model
```dart
FlashCard {
  id: String,          // Unique ID
  term: String,        // Question/term
  definition: String   // Answer/definition
}
```

### Question Model
```dart
Question {
  id: String,                      // Unique ID
  question: String,                // Question text
  options: List<String>,           // 4 answer options
  correctAnswerIndex: int,         // Index of correct answer (0-3)
  explanation: String              // Explanation shown after answering
}
```

### UserData Model
```dart
UserData {
  coins: int,                      // Total coins earned
  streak: int,                     // Current correct streak
  purchasedItems: Set<String>,     // IDs of purchased items
  activeTheme: String,             // Currently selected theme
  lastPlayedDate: DateTime?        // Last app usage date
}
```

### ShopItem Model
```dart
ShopItem {
  id: String,          // Unique ID
  name: String,        // Display name
  description: String, // Item description
  cost: int,           // Price in coins
  type: String         // 'theme' | 'icon' | 'colorpack'
}
```

---

## 🎮 User Flow Diagrams

### Main Navigation Flow
```
Splash/Init
    ↓
Home Screen (Topic Selection)
    ├── → Flash Cards Screen
    │    ├── Learn Cards
    │    └── Back to Home
    │
    ├── → Quiz Screen
    │    ├── Answer Questions (+5 coins on correct)
    │    ├── See Feedback
    │    └── Back to Home
    │
    └── → Shop Screen
         ├── View Items
         ├── Buy Themes/Items
         ├── Switch Themes
         └── Back to Home
```

### Coin Economy Flow
```
Quiz Question (Correct)
    ↓
+5 Coins
    ↓
Coins Display Updates
    ↓
Can Use Coins in Shop
    ↓
Purchase Item (20 coins)
    ↓
Item Unlocked Permanently
    ↓
If Theme: Apply Immediately
```

### Streak System Flow
```
Quiz Question Answered
    ├── CORRECT
    │   ├── +1 to Streak
    │   ├── +5 Coins
    │   └── Display in AppBar
    │
    └── INCORRECT
        ├── Streak = 0
        ├── +0 Coins
        └── Display in AppBar
```

---

## 🔧 Architecture Overview

### State Management (Provider Pattern)
```
UserDataProvider
├── Manages: coins, streak, purchased items
├── Methods:
│   ├── addCoins(amount)
│   ├── subtractCoins(amount)
│   ├── incrementStreak()
│   ├── resetStreak()
│   ├── purchaseItem(itemId, cost)
│   └── isItemPurchased(itemId)
└── Updates: LocalStorageService

ThemeProvider
├── Manages: current theme
├── Methods:
│   ├── setTheme(themeName)
│   └── initializeTheme(savedTheme)
└── Notifies: MaterialApp to rebuild with new theme
```

### Local Storage Layer
```
LocalStorageService
├── Uses: SharedPreferences
├── Manages:
│   ├── getCoins() / setCoins()
│   ├── getStreak() / setStreak()
│   ├── getPurchasedItems() / addPurchasedItem()
│   ├── getActiveTheme() / setActiveTheme()
│   └── getLastPlayedDate() / updateLastPlayedDate()
└── Persists: All data to device
```

### Screen Architecture
```
HomeScreen
└── Lists Topics
    └── OnTap → Shows BottomSheet
        ├── Flash Cards Button
        ├── Quiz Button
        └── Close Button

FlashCardsScreen
├── Displays Cards
├── Navigation: Prev/Next
└── Progress Tracking

QuizScreen
├── Displays Questions
├── Answer Selection
├── Feedback Dialog
├── Coin/Streak Updates
└── Final Score Screen

ShopScreen
├── Category Tabs
├── Item Grid
├── Purchase Logic
├── Theme Selection
└── Feedback Snackbars
```

---

## 📱 UI Components & Widgets

### Custom Widgets
| Widget | Purpose |
|--------|---------|
| `MoneyQuestAppBar` | App bar with coins & streak badges |
| `RoundedButton` | Primary button with rounded corners |
| `MoneyQuestCard` | Rounded card container |
| `FlashCardWidget` | Flash card display (term/definition) |
| `QuestionWidget` | Quiz question with options |
| `FeedbackWidget` | Correct/incorrect feedback dialog |

### Theme Colors

#### Default Theme
- Primary: Blue
- Accent: Yellow
- Background: White

#### Neon Theme
- Primary: Purple
- Accent: Cyan
- Background: Dark (0xFF0A0E27)

#### Dark Theme
- Primary: Teal
- Accent: Teal Accent
- Background: Very Dark (0xFF121212)

#### Pastel Theme
- Primary: Hot Pink
- Accent: Plum
- Background: Very Light Pink (0xFFFFF0F5)

---

## 🔐 Data Privacy & Security

### What's Stored
✅ User progress (coins, streak)
✅ Purchased items
✅ Theme preference
✅ Last played date

### What's NOT Stored
❌ Personal information
❌ Passwords
❌ Contact data
❌ Analytics/tracking

### Where It's Stored
- **Android:** App private directory via SharedPreferences
- **iOS:** App library/preferences directory
- **All Platforms:** Local, encrypted, no network transmission

---

## 🚀 Performance Optimizations

1. **Lazy Loading:** Topics load on demand
2. **Efficient Storage:** Using SharedPreferences (optimized key-value store)
3. **Widget Optimization:** Proper use of `const` constructors
4. **Memory Management:** Proper disposal of controllers
5. **UI Responsiveness:** Hot reload enabled for development

---

## 🔄 Data Flow Example: Answering a Quiz Question

1. User opens Quiz Screen (QuizScreen initialized)
2. Question displays (QuestionWidget)
3. User taps answer option
4. `onOptionSelected` callback fires
5. Answer validation (is selected == correct)
6. If correct:
   - `UserDataProvider.addCoins(5)` called
   - `UserDataProvider.incrementStreak()` called
   - LocalStorageService saves to device
   - Feedback shows "✅ Correct! +5 Coins"
7. If incorrect:
   - `UserDataProvider.resetStreak()` called
   - LocalStorageService saves to device
   - Feedback shows "❌ Incorrect"
8. User proceeds to next question or finishes quiz
9. All changes persist to device

---

## 🎨 Customization Guide

### Adding a New Topic

Edit `lib/data/sample_data.dart`:

```dart
Topic(
  id: 'my_topic',
  title: 'My Topic',
  description: 'Description',
  icon: '🎯',
  flashCards: [
    // Add FlashCard objects
  ],
  questions: [
    // Add Question objects
  ],
)
```

### Adding a New Theme

Edit `lib/services/theme_provider.dart`:

```dart
static ThemeData myTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.myColor,
  ),
  // Customize colors, fonts, etc.
);

static ThemeData getTheme(String themeName) {
  switch(themeName) {
    case 'mytheme':
      return myTheme;
    // ...
  }
}
```

### Adding Shop Items

Edit `lib/data/shop_data.dart`:

```dart
ShopItem(
  id: 'my_item',
  name: 'My Item',
  description: 'Description',
  cost: 20,
  type: 'theme', // or 'icon', 'colorpack'
),
```

---

## 📈 Key Metrics & Stats

### Topics
- Count: 5 topics
- Flash cards per topic: 3-4 cards
- Questions per topic: 5 questions

### Coins
- Earn: 5 coins per correct answer
- Max earn per topic: 25 coins (5 questions × 5 coins)
- Shop item cost: 20 coins

### Shop
- Total items: 8 items
- Themes: 3 purchasable + 1 default
- Icons: 2 items
- Color packs: 2 items

### Themes
- Built-in: 4 themes
- Default available: 1 (free)
- Purchasable: 3 (20 coins each)

---

## 🐛 Known Limitations & Notes

1. **No Backend:** All data is local-only. Switching devices requires manual data export.
2. **No Multiplayer:** Single-player experience only
3. **No Ads:** App is completely ad-free
4. **No External APIs:** 100% offline functionality
5. **Limited Customization:** Theme colors are fixed (can be extended)

---

## 🔮 Future Enhancement Ideas

- Progress charts and statistics
- Difficulty levels (easy/medium/hard)
- Time-limited quizzes
- Leaderboards (local)
- Achievement badges
- Daily login streaks
- Export/import progress
- Sound effects
- Additional languages
- More topics and questions

---

**Last Updated:** December 2025
**Version:** 1.0.0
**Status:** ✅ Production Ready
