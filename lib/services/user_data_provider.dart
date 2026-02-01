/// User Data Provider
/// Manages global user state (coins, streak, purchases, theme)
library;

import 'package:flutter/material.dart';
import '../models/models.dart';
import 'local_storage_service.dart';

class UserDataProvider extends ChangeNotifier {
  late LocalStorageService _storageService;
  late UserData _userData;

  UserData get userData => _userData;
  int get coins => _userData.coins;
  int get streak => _userData.streak;
  String get activeTheme => _userData.activeTheme;
  Set<String> get purchasedItems => _userData.purchasedItems;

  /// Initialize provider with storage service
  Future<void> init(LocalStorageService storageService) async {
    _storageService = storageService;
    await _loadUserData();
  }

  /// Load user data from storage
  Future<void> _loadUserData() async {
    final coins = _storageService.getCoins();
    final streak = _storageService.getStreak();
    final purchasedItems = _storageService.getPurchasedItems().toSet();
    final activeTheme = _storageService.getActiveTheme();
    final lastPlayedDate = _storageService.getLastPlayedDate();

    _userData = UserData(
      coins: coins,
      streak: streak,
      purchasedItems: purchasedItems,
      activeTheme: activeTheme,
      lastPlayedDate: lastPlayedDate,
    );
    notifyListeners();
  }

  /// Add coins and update storage
  Future<void> addCoins(int amount) async {
    final newCoins = _userData.coins + amount;
    _userData = _userData.copyWith(coins: newCoins);
    await _storageService.setCoins(newCoins);
    notifyListeners();
  }

  /// Subtract coins (for purchases)
  Future<bool> subtractCoins(int amount) async {
    if (_userData.coins >= amount) {
      final newCoins = _userData.coins - amount;
      _userData = _userData.copyWith(coins: newCoins);
      await _storageService.setCoins(newCoins);
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Increment streak
  Future<void> incrementStreak() async {
    final newStreak = _userData.streak + 1;
    _userData = _userData.copyWith(streak: newStreak);
    await _storageService.setStreak(newStreak);
    notifyListeners();
  }

  /// Reset streak
  Future<void> resetStreak() async {
    _userData = _userData.copyWith(streak: 0);
    await _storageService.setStreak(0);
    notifyListeners();
  }

  /// Purchase a shop item
  Future<bool> purchaseItem(String itemId, int cost) async {
    if (await subtractCoins(cost)) {
      final newPurchasedItems = Set<String>.from(_userData.purchasedItems);
      newPurchasedItems.add(itemId);
      _userData = _userData.copyWith(purchasedItems: newPurchasedItems);
      await _storageService.addPurchasedItem(itemId);
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Check if item is purchased
  bool isItemPurchased(String itemId) {
    return _userData.purchasedItems.contains(itemId);
  }

  /// Change active theme
  Future<void> setActiveTheme(String themeName) async {
    _userData = _userData.copyWith(activeTheme: themeName);
    await _storageService.setActiveTheme(themeName);
    notifyListeners();
  }

  /// Update last played date
  Future<void> updateLastPlayedDate() async {
    final now = DateTime.now();
    _userData = _userData.copyWith(lastPlayedDate: now);
    await _storageService.updateLastPlayedDate();
    notifyListeners();
  }
}
