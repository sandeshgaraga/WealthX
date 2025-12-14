/// Home Screen
/// Displays topic selection and navigation to different app sections

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/sample_data.dart';
import '../models/models.dart';
import '../services/user_data_provider.dart';
import '../widgets/common_widgets.dart';
import 'flashcards_screen.dart';
import 'quiz_screen.dart';
import 'shop_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Custom app bar with coins and streak
          SliverAppBar(
            pinned: true,
            elevation: 4,
            expandedHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('MoneyQuest'),
              centerTitle: true,
            ),
            actions: [
              Consumer<UserDataProvider>(
                builder: (context, userDataProvider, child) {
                  return Row(
                    children: [
                      // Streak badge
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Text('🔥', style: TextStyle(fontSize: 18)),
                            const SizedBox(width: 4),
                            Text(
                              userDataProvider.streak.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Coins badge
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Text('💰', style: TextStyle(fontSize: 18)),
                            const SizedBox(width: 4),
                            Text(
                              userDataProvider.coins.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  );
                },
              ),
            ],
          ),

          // Main content
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome message
                    Text(
                      'Welcome to MoneyQuest!',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Learn financial literacy through fun cards and quizzes!',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),

                    // Topics section
                    Text(
                      'Topics',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 20,
                              ),
                    ),
                    const SizedBox(height: 16),

                    // Topic cards grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: sampleTopics.length,
                      itemBuilder: (context, index) {
                        final topic = sampleTopics[index];
                        return _TopicCard(topic: topic);
                      },
                    ),
                    const SizedBox(height: 24),

                    // Shop button
                    Center(
                      child: RoundedButton(
                        label: 'Shop',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ShopScreen(),
                            ),
                          );
                        },
                        backgroundColor: Colors.purple,
                        icon: Icons.shopping_cart,
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

/// Topic card widget for home screen
class _TopicCard extends StatelessWidget {
  final Topic topic;

  const _TopicCard({required this.topic});

  @override
  Widget build(BuildContext context) {
    return MoneyQuestCard(
      padding: const EdgeInsets.all(12),
      onTap: () => _showTopicModal(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Text(
            topic.icon,
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 8),
          // Title
          Text(
            topic.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          // Description
          Text(
            topic.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: Colors.grey,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// Show modal with flashcard and quiz options
  void _showTopicModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                topic.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 24,
                    ),
              ),
              const SizedBox(height: 24),

              // Flashcards button
              SizedBox(
                width: double.infinity,
                child: RoundedButton(
                  label: 'Flash Cards 📚',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => FlashCardsScreen(topic: topic),
                      ),
                    );
                  },
                  backgroundColor: Colors.orange,
                ),
              ),
              const SizedBox(height: 12),

              // Quiz button
              SizedBox(
                width: double.infinity,
                child: RoundedButton(
                  label: 'Quiz 🎯',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => QuizScreen(topic: topic),
                      ),
                    );
                  },
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(height: 12),

              // Close button
              SizedBox(
                width: double.infinity,
                child: RoundedButton(
                  label: 'Close',
                  onPressed: () => Navigator.pop(context),
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
