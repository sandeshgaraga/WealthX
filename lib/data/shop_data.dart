/// Shop Data
/// Contains all purchasable items in the MoneyQuest shop

import '../models/models.dart';

final List<ShopItem> shopItems = [
  /// Themes
  ShopItem(
    id: 'theme_neon',
    name: 'Neon Theme',
    description: 'Vibrant neon colors - cool and energetic!',
    cost: 20,
    type: 'theme',
  ),
  ShopItem(
    id: 'theme_dark',
    name: 'Dark Theme',
    description: 'Easy on the eyes with dark colors.',
    cost: 20,
    type: 'theme',
  ),
  ShopItem(
    id: 'theme_pastel',
    name: 'Pastel Theme',
    description: 'Soft, friendly, and relaxing colors.',
    cost: 20,
    type: 'theme',
  ),

  /// Icons / Cosmetics
  ShopItem(
    id: 'icon_gold_coin',
    name: 'Gold Coin Icon',
    description: 'Shiny gold coin design.',
    cost: 20,
    type: 'icon',
  ),
  ShopItem(
    id: 'icon_diamond',
    name: 'Diamond Badge',
    description: 'Sparkly diamond achievement badge.',
    cost: 20,
    type: 'icon',
  ),

  /// Color Packs
  ShopItem(
    id: 'colorpack_sunset',
    name: 'Sunset Color Pack',
    description: 'Warm orange and pink colors.',
    cost: 20,
    type: 'colorpack',
  ),
  ShopItem(
    id: 'colorpack_ocean',
    name: 'Ocean Color Pack',
    description: 'Cool blue and teal colors.',
    cost: 20,
    type: 'colorpack',
  ),
];
