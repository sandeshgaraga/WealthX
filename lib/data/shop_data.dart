/// Shop Data
/// Contains all purchasable items in the MoneyQuest shop

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

  /// Icons / Cosmetics
  ShopItem(
    id: 'icon_diamond',
    name: 'Diamond Badge',
    description: 'Sparkly diamond achievement badge.',
    cost: 200,
    type: 'icon',
  ),

  /// Color Packs
  ShopItem(
    id: 'colorpack_sunset',
    name: 'Sunset Color Pack',
    description: 'Warm orange and pink colors.',
    cost: 300,
    type: 'colorpack',
  ),
  ShopItem(
    id: 'colorpack_ocean',
    name: 'Ocean Color Pack',
    description: 'Cool blue and teal colors.',
    cost: 350,
    type: 'colorpack',
  ),
];
