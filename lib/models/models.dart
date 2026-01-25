/// Models for MoneyQuest app
/// Contains data classes for Questions, FlashCards, Topics, Users, and Shop Items

/// Represents a single flash card with a term and definition
class FlashCard {
  final String id;
  final String term;
  final String definition;

  FlashCard({
    required this.id,
    required this.term,
    required this.definition,
  });
}

/// Represents a multiple-choice quiz question
class Question {
  final String id;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });
}

/// Represents a financial literacy topic
class Topic {
  final String id;
  final String title;
  final String description;
  final String icon;
  final List<FlashCard> flashCards;
  final List<Question> questions;

  Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.flashCards,
    required this.questions,
  });
}

/// Represents a purchasable shop item
class ShopItem {
  final String id;
  final String name;
  final String description;
  final int cost; // in coins
  final String type; // 'theme', 'icon', 'colorpack'

  ShopItem({
    required this.id,
    required this.name,
    required this.description,
    required this.cost,
    required this.type,
  });
}

/// Represents user data stored locally
class UserData {
  final int coins;
  final int streak;
  final Set<String> purchasedItems;
  final String activeTheme;
  final DateTime? lastPlayedDate;

  UserData({
    required this.coins,
    required this.streak,
    required this.purchasedItems,
    required this.activeTheme,
    this.lastPlayedDate,
  });

  /// Create a copy with modified fields
  UserData copyWith({
    int? coins,
    int? streak,
    Set<String>? purchasedItems,
    String? activeTheme,
    DateTime? lastPlayedDate,
  }) {
    return UserData(
      coins: coins ?? this.coins,
      streak: streak ?? this.streak,
      purchasedItems: purchasedItems ?? this.purchasedItems,
      activeTheme: activeTheme ?? this.activeTheme,
      lastPlayedDate: lastPlayedDate ?? this.lastPlayedDate,
    );
  }
}
