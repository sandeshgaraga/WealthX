/// Flash Cards Screen
/// Simple flash card interface with swipe/navigation
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../services/user_data_provider.dart';
import '../widgets/common_widgets.dart';

class FlashCardsScreen extends StatefulWidget {
  final Topic topic;

  const FlashCardsScreen({
    super.key,
    required this.topic,
  });

  @override
  State<FlashCardsScreen> createState() => _FlashCardsScreenState();
}

class _FlashCardsScreenState extends State<FlashCardsScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  bool _showDefinition = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Update last played date
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserDataProvider>().updateLastPlayedDate();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final flashCards = widget.topic.flashCards;
    final userDataProvider = context.watch<UserDataProvider>();

    return Scaffold(
      appBar: MoneyQuestAppBar(
        title: 'Flash Cards - ${widget.topic.title}',
        coins: userDataProvider.coins,
        streak: userDataProvider.streak,
      ),
      body: Column(
        children: [
          // Progress indicator
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Card ${_currentIndex + 1} of ${flashCards.length}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '${((_currentIndex + 1) / flashCards.length * 100).toStringAsFixed(0)}%',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: (_currentIndex + 1) / flashCards.length,
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),

          // Flash card display
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  _showDefinition = false;
                });
              },
              itemCount: flashCards.length,
              itemBuilder: (context, index) {
                final card = flashCards[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _showDefinition = !_showDefinition;
                    });
                  },
                  child: FlashCardWidget(
                    term: card.term,
                    definition: card.definition,
                    showDefinition: _showDefinition,
                  ),
                );
              },
            ),
          ),

          // Navigation buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Previous button
                ElevatedButton.icon(
                  onPressed: _currentIndex > 0
                      ? () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                ),

                // Progress text
                Text(
                  '${_currentIndex + 1}/${flashCards.length}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 20,
                      ),
                ),

                // Next button
                ElevatedButton.icon(
                  onPressed: _currentIndex < flashCards.length - 1
                      ? () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      : null,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Next'),
                ),
              ],
            ),
          ),

          // Back button
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RoundedButton(
              label: 'Back to Home',
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
