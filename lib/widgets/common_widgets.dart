/// Reusable Widgets for MoneyQuest
/// Common UI components used across the app

import 'package:flutter/material.dart';

/// Custom app bar with coin and streak display
class MoneyQuestAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int coins;
  final int streak;

  const MoneyQuestAppBar({
    Key? key,
    required this.title,
    required this.coins,
    required this.streak,
  }) : super(key: key);

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
                color: const Color.fromARGB(255, 0, 255, 0),
                borderRadius: BorderRadius.circular(20),
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

/// Rounded button widget
class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;
  final IconData? icon;

  const RoundedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 18,
    this.icon,
  }) : super(key: key);

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
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

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
    Key? key,
    required this.term,
    required this.definition,
    required this.showDefinition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MoneyQuestCard(
        padding: const EdgeInsets.all(32),
        backgroundColor: Colors.blue.withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showDefinition)
              Column(
                children: [
                  Text(
                    'Definition',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
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
                    ),
              ),
            const SizedBox(height: 32),
            Text(
              showDefinition
                  ? 'Tap to reveal term →'
                  : 'Tap to reveal definition →',
              style: TextStyle(
                color: Colors.grey.shade600,
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
  final Function(int) onOptionSelected;
  final bool isAnswered;

  const QuestionWidget({
    Key? key,
    required this.question,
    required this.options,
    required this.selectedIndex,
    required this.onOptionSelected,
    this.isAnswered = false,
  }) : super(key: key);

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
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: isAnswered ? null : () => onOptionSelected(index),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedIndex == index
                    ? Colors.green.withOpacity(0.7)
                    : Colors.grey.shade300,
                foregroundColor:
                    selectedIndex == index ? Colors.white : Colors.black87,
                minimumSize: const Size(double.infinity, 56),
                disabledBackgroundColor: selectedIndex == index
                    ? Colors.green.withOpacity(0.7)
                    : Colors.grey.shade300,
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
          ),
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
    Key? key,
    required this.isCorrect,
    required this.explanation,
    required this.onNext,
  }) : super(key: key);

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
              child: const Text('Next Question'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Loading widget
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
