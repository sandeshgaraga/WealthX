/// Shop Data
/// Contains all purchasable items in the MoneyQuest shop
library;

import '../models/models.dart';

final List<ShopItem> shopItems = [
  /// Themes
  ShopItem(
    id: 'theme_default',
    name: 'Default Theme',
    description: 'The classic MoneyQuest look.',
    cost: 0,
    type: 'theme',
  ),
  ShopItem(
    id: 'theme_dark',
    name: 'Dark Theme',
    description: 'Easy on the eyes with dark colors.',
    cost: 40,
    type: 'theme',
  ),
  ShopItem(
    id: 'theme_pastel',
    name: 'Pastel Theme',
    description: 'Soft, friendly, and relaxing colors.',
    cost: 60,
    type: 'theme',
  ),
  ShopItem(
    id: 'theme_gold',
    name: 'Gold Theme',
    description: 'Luxurious gold and premium colors.',
    cost: 100,
    type: 'theme',
  ),

  /// Color Packs
];
