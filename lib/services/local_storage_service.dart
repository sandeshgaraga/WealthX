/// Local Storage Service
/// Handles all persistent data storage using SharedPreferences

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _coinsKey = 'coins';
  static const String _streakKey = 'streak';
  static const String _purchasedItemsKey = 'purchased_items';
  static const String _activeThemeKey = 'active_theme';
  static const String _lastPlayedDateKey = 'last_played_date';

  late SharedPreferences _prefs;

  /// Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Get current coins
  int getCoins() {
    return _prefs.getInt(_coinsKey) ?? 0;
  }

  /// Add coins
  Future<void> addCoins(int amount) async {
    final current = getCoins();
    await _prefs.setInt(_coinsKey, current + amount);
  }

  /// Set coins directly
  Future<void> setCoins(int amount) async {
    await _prefs.setInt(_coinsKey, amount);
  }

  /// Get current streak
  int getStreak() {
    return _prefs.getInt(_streakKey) ?? 0;
  }

  /// Increment streak
  Future<void> incrementStreak() async {
    final current = getStreak();
    await _prefs.setInt(_streakKey, current + 1);
  }

  /// Reset streak to 0
  Future<void> resetStreak() async {
    await _prefs.setInt(_streakKey, 0);
  }

  /// Set streak directly
  Future<void> setStreak(int value) async {
    await _prefs.setInt(_streakKey, value);
  }

  /// Get purchased items
  List<String> getPurchasedItems() {
    return _prefs.getStringList(_purchasedItemsKey) ?? [];
  }

  /// Add purchased item
  Future<void> addPurchasedItem(String itemId) async {
    final items = getPurchasedItems();
    if (!items.contains(itemId)) {
      items.add(itemId);
      await _prefs.setStringList(_purchasedItemsKey, items);
    }
  }

  /// Check if item is purchased
  bool isItemPurchased(String itemId) {
    return getPurchasedItems().contains(itemId);
  }

  /// Get active theme
  String getActiveTheme() {
    return _prefs.getString(_activeThemeKey) ?? 'default';
  }

  /// Set active theme
  Future<void> setActiveTheme(String themeName) async {
    await _prefs.setString(_activeThemeKey, themeName);
  }

  /// Get last played date
  DateTime? getLastPlayedDate() {
    final dateString = _prefs.getString(_lastPlayedDateKey);
    if (dateString != null) {
      return DateTime.parse(dateString);
    }
    return null;
  }

  /// Set last played date to now
  Future<void> updateLastPlayedDate() async {
    await _prefs.setString(
        _lastPlayedDateKey, DateTime.now().toIso8601String());
  }

  /// Reset all data (for debugging)
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
