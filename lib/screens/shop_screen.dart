/// Shop Screen
/// In-app shop for purchasing cosmetic items with coins

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/shop_data.dart';
import '../models/models.dart';
import '../services/user_data_provider.dart';
import '../services/theme_provider.dart';
import '../widgets/common_widgets.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String _selectedCategory = 'all'; // 'all', 'theme', 'icon', 'colorpack'

  @override
  Widget build(BuildContext context) {
    final userDataProvider = context.watch<UserDataProvider>();
    final themeProvider = context.watch<ThemeProvider>();

    // Filter items by category
    final filteredItems = _selectedCategory == 'all'
        ? shopItems
        : shopItems.where((item) => item.type == _selectedCategory).toList();

    return Scaffold(
      appBar: MoneyQuestAppBar(
        title: 'Shop',
        coins: userDataProvider.coins,
        streak: userDataProvider.streak,
      ),
      body: Column(
        children: [
          // Category tabs
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _CategoryButton(
                    label: 'All',
                    isSelected: _selectedCategory == 'all',
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'all';
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  _CategoryButton(
                    label: 'Themes 🎨',
                    isSelected: _selectedCategory == 'theme',
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'theme';
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  _CategoryButton(
                    label: 'Icons ⭐',
                    isSelected: _selectedCategory == 'icon',
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'icon';
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  _CategoryButton(
                    label: 'Colors 🌈',
                    isSelected: _selectedCategory == 'colorpack',
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'colorpack';
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Shop items grid
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Text(
                      'No items in this category',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      final isPurchased =
                          userDataProvider.isItemPurchased(item.id);
                      final isTheme = item.type == 'theme';
                      final isActiveTheme = isTheme &&
                          themeProvider.currentTheme == _getThemeName(item.id);

                      return _ShopItemCard(
                        item: item,
                        isPurchased: isPurchased,
                        isActiveTheme: isActiveTheme && isTheme,
                        onPurchase: () {
                          _handlePurchase(
                            context,
                            item,
                            userDataProvider,
                            themeProvider,
                          );
                        },
                        onSelectTheme: isTheme && isPurchased
                            ? () {
                                _handleSelectTheme(
                                  context,
                                  item,
                                  themeProvider,
                                );
                              }
                            : null,
                      );
                    },
                  ),
          ),

          // Info section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '💡 Tip: Earn coins by answering quiz questions correctly!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.amber.shade700,
                    fontStyle: FontStyle.italic,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  /// Handle shop item purchase
  void _handlePurchase(
    BuildContext context,
    ShopItem item,
    UserDataProvider userDataProvider,
    ThemeProvider themeProvider,
  ) async {
    final success = await userDataProvider.purchaseItem(item.id, item.cost);

    if (success) {
      // If it's a theme, auto-select it
      if (item.type == 'theme') {
        final themeName = _getThemeName(item.id);
        themeProvider.setTheme(themeName);
        await userDataProvider.setActiveTheme(themeName);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ ${item.name} purchased!'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('❌ Not enough coins!'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  /// Handle theme selection
  void _handleSelectTheme(
    BuildContext context,
    ShopItem item,
    ThemeProvider themeProvider,
  ) async {
    final themeName = _getThemeName(item.id);
    themeProvider.setTheme(themeName);
    await context.read<UserDataProvider>().setActiveTheme(themeName);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ Theme changed to ${item.name}!'),
          backgroundColor: Colors.blue,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  /// Extract theme name from shop item ID
  String _getThemeName(String itemId) {
    if (itemId.startsWith('theme_')) {
      return itemId.replaceFirst('theme_', '');
    }
    return 'default';
  }
}

/// Shop item card widget
class _ShopItemCard extends StatelessWidget {
  final ShopItem item;
  final bool isPurchased;
  final bool isActiveTheme;
  final VoidCallback onPurchase;
  final VoidCallback? onSelectTheme;

  const _ShopItemCard({
    required this.item,
    required this.isPurchased,
    required this.isActiveTheme,
    required this.onPurchase,
    this.onSelectTheme,
  });

  @override
  Widget build(BuildContext context) {
    return MoneyQuestCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Item name and icon
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                item.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          // Price and button
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price or owned badge
              if (isPurchased)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '✓ Owned',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                )
              else
                Row(
                  children: [
                    const Text(
                      '💰',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${item.cost}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              const SizedBox(height: 8),

              // Buttons
              if (isPurchased && isActiveTheme)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Active',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                )
              else if (isPurchased && onSelectTheme != null)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onSelectTheme,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(4),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Select',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                )
              else if (!isPurchased)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPurchase,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(4),
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      'Buy',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Category filter button
class _CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const _CategoryButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey.shade300,
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        elevation: isSelected ? 4 : 0,
      ),
      child: Text(label),
    );
  }
}
