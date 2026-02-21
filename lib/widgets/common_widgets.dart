/// Reusable Widgets for MoneyQuest
/// Common UI components used across the app
library;

import 'package:flutter/material.dart';

/// Custom app bar with coin and streak display
class MoneyQuestAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int coins;
  final int streak;

  const MoneyQuestAppBar({
    super.key,
    required this.title,
    required this.coins,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 4,
      actions: [
        // Streak display
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.black, width: 2, style: BorderStyle.solid),
              ),
              child: Row(
                children: [
                  const Text(
                    '🔥',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    streak.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(221, 255, 255, 255),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Coins display
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 11, 207, 60),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.black, width: 2, style: BorderStyle.solid),
              ),
              child: Row(
                children: [
                  const Text(
                    '💰',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    coins.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(221, 255, 255, 255),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Reusable streak badge widget
class StreakBadge extends StatelessWidget {
  final int streak;

  const StreakBadge({
    super.key,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🔥', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 6),
          Text(
            streak.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(221, 255, 255, 255),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

/// Reusable coins badge widget
class CoinsBadge extends StatelessWidget {
  final int coins;

  const CoinsBadge({
    super.key,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 11, 207, 60),
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('💰', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 6),
          Text(
            coins.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(221, 255, 255, 255),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

/// Rounded button widget
class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;
  final IconData? icon;

  const RoundedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 18,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
      label: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: textColor ?? Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

/// Card widget for displaying content
class MoneyQuestCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const MoneyQuestCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

/// Flash card display widget
class FlashCardWidget extends StatelessWidget {
  final String term;
  final String definition;
  final bool showDefinition;

  const FlashCardWidget({
    super.key,
    required this.term,
    required this.definition,
    required this.showDefinition,
  });

  @override
  Widget build(BuildContext context) {
    // Get card background color based on theme
    Color cardBackgroundColor = Colors.grey.shade800;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MoneyQuestCard(
        padding: const EdgeInsets.all(32),
        backgroundColor: cardBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showDefinition)
              Column(
                children: [
                  Text(
                    'Definition',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    definition,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                  ),
                ],
              )
            else
              Text(
                term,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 32,
                      color: Colors.white,
                    ),
              ),
            const SizedBox(height: 32),
            Text(
              showDefinition
                  ? 'Tap to reveal term →'
                  : 'Tap to reveal definition →',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Quiz question widget
class QuestionWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final int? selectedIndex;
  final int? correctIndex;
  final Function(int) onOptionSelected;
  final bool isAnswered;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.options,
    required this.selectedIndex,
    required this.onOptionSelected,
    this.isAnswered = false,
    this.correctIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 20,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        ...List.generate(
          options.length,
          (index) {
            bool isSelected = selectedIndex == index;
            bool isCorrect = correctIndex == index;

            Color buttonColor = Colors.grey.shade300;
            Color textColor = Colors.black87;

            if (isSelected && isAnswered) {
              if (isCorrect) {
                buttonColor = Colors.green.withOpacity(0.7);
                textColor = Colors.white;
              } else {
                buttonColor = Colors.red.withOpacity(0.7);
                textColor = Colors.white;
              }
            } else if (isSelected && !isAnswered) {
              buttonColor = Colors.green.withOpacity(0.7);
              textColor = Colors.white;
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: isAnswered ? null : () => onOptionSelected(index),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: textColor,
                  minimumSize: const Size(double.infinity, 56),
                  disabledBackgroundColor: buttonColor,
                ),
                child: Text(
                  options[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Feedback widget (correct/incorrect)
class FeedbackWidget extends StatelessWidget {
  final bool isCorrect;
  final String explanation;
  final VoidCallback onNext;

  const FeedbackWidget({
    super.key,
    required this.isCorrect,
    required this.explanation,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isCorrect ? '✅ Correct!' : '❌ Incorrect',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isCorrect ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            if (isCorrect)
              const Text(
                '+5 Coins earned! 💰',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              )
            else
              const Text(
                'Streak reset to 0',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              explanation,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onNext,
              child: const Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Loading widget
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
