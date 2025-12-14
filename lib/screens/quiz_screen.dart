/// Quiz Screen
/// Multiple-choice quiz with feedback and coin rewards

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../services/user_data_provider.dart';
import '../widgets/common_widgets.dart';

class QuizScreen extends StatefulWidget {
  final Topic topic;

  const QuizScreen({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> _questions;
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;
  int _correctCount = 0;

  @override
  void initState() {
    super.initState();
    _questions = widget.topic.questions;
    // Update last played date
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserDataProvider>().updateLastPlayedDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userDataProvider = context.watch<UserDataProvider>();
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: MoneyQuestAppBar(
        title: 'Quiz - ${widget.topic.title}',
        coins: userDataProvider.coins,
        streak: userDataProvider.streak,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${_correctCount} Correct',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: (_currentQuestionIndex + 1) / _questions.length,
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 24),

              // Question card
              MoneyQuestCard(
                padding: const EdgeInsets.all(24),
                child: QuestionWidget(
                  question: question.question,
                  options: question.options,
                  selectedIndex: _selectedAnswerIndex,
                  onOptionSelected: (index) {
                    if (!_isAnswered) {
                      setState(() {
                        _selectedAnswerIndex = index;
                        _isAnswered = true;
                      });
                      _handleAnswerSubmission(context);
                    }
                  },
                  isAnswered: _isAnswered,
                ),
              ),

              const SizedBox(height: 24),

              // Continue or finish button
              if (_isAnswered)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentQuestionIndex < _questions.length - 1) {
                        setState(() {
                          _currentQuestionIndex++;
                          _selectedAnswerIndex = null;
                          _isAnswered = false;
                        });
                      } else {
                        _showQuizComplete(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      _currentQuestionIndex < _questions.length - 1
                          ? 'Next Question'
                          : 'Finish Quiz',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Handle answer submission - show feedback
  void _handleAnswerSubmission(BuildContext context) {
    final question = _questions[_currentQuestionIndex];
    final isCorrect = _selectedAnswerIndex == question.correctAnswerIndex;

    // Update user data based on answer
    Future.delayed(const Duration(milliseconds: 500), () async {
      if (isCorrect) {
        setState(() {
          _correctCount++;
        });
        // Add coins and increment streak
        await context.read<UserDataProvider>().addCoins(5);
        await context.read<UserDataProvider>().incrementStreak();
      } else {
        // Reset streak on incorrect answer
        await context.read<UserDataProvider>().resetStreak();
      }

      // Show feedback dialog
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return FeedbackWidget(
              isCorrect: isCorrect,
              explanation: question.explanation,
              onNext: () {
                Navigator.pop(context);
              },
            );
          },
        );
      }
    });
  }

  /// Show quiz completion screen
  void _showQuizComplete(BuildContext context) {
    final score = _correctCount;
    final total = _questions.length;
    final percentage = (score / total * 100).toStringAsFixed(0);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'Quiz Complete! 🎉',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Score: $score/$total',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              if (score == total)
                const Text(
                  'Perfect Score! You are a Money Master! 👑',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.amber),
                )
              else if (score >= total * 0.8)
                const Text(
                  'Great job! You understand this topic well!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green),
                )
              else if (score >= total * 0.6)
                const Text(
                  'Good effort! Keep learning to master this topic.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.orange),
                )
              else
                const Text(
                  'Keep practicing! You will improve with more learning.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        );
      },
    );
  }
}
