/// Sample data for MoneyQuest app
/// Contains all topics, flash cards, and quiz questions
library;

import '../models/models.dart';

/// Sample topics with flash cards and questions
final List<Topic> sampleTopics = [
  /// Topic 1: Saving
  Topic(
    id: 'saving',
    title: 'Saving Money',
    description: 'Learn how to save money for the future!',
    icon: '💰',
    flashCards: [
      FlashCard(
        id: 'save_1',
        term: 'Savings Account',
        definition:
            'A bank account where you store money and earn interest over time.',
      ),
      FlashCard(
        id: 'save_2',
        term: 'Interest',
        definition: 'Extra money the bank pays you for keeping money there.',
      ),
      FlashCard(
        id: 'save_3',
        term: 'Emergency Fund',
        definition: 'Money saved for unexpected expenses like medical bills.',
      ),
      FlashCard(
        id: 'save_4',
        term: 'Goal-Based Saving',
        definition:
            'Saving money for a specific purpose like a bike or vacation.',
      ),
    ],
    questions: [
      Question(
        id: 'save_q1',
        question: 'Why is it important to save money?',
        options: [
          'To have money for emergencies and goals',
          'To buy things immediately',
          'To show off to friends',
          'Saving money is not important'
        ],
        correctAnswerIndex: 0,
        explanation:
            'Saving money helps you prepare for unexpected events and work toward your goals!',
      ),
      Question(
        id: 'save_q2',
        question: 'What is interest?',
        options: [
          'Money you owe to someone',
          'Extra money the bank pays you',
          'A fee for using a bank account',
          'Money you spend on entertainment'
        ],
        correctAnswerIndex: 1,
        explanation:
            'Interest is a reward from the bank for letting them use your money!',
      ),
      Question(
        id: 'save_q3',
        question: 'How often should you add to your savings?',
        options: [
          'Only when you have extra money',
          'Regularly, like every week or month',
          'Never, one-time savings is enough',
          'Only on special occasions'
        ],
        correctAnswerIndex: 1,
        explanation:
            'Regular saving helps your money grow faster and makes it a good habit!',
      ),
      Question(
        id: 'save_q4',
        question: 'What should you do with an emergency fund?',
        options: [
          'Spend it on fun things',
          'Only use it for real emergencies',
          'Invest it immediately',
          'Give it all away'
        ],
        correctAnswerIndex: 1,
        explanation:
            'Emergency funds should be saved for unexpected expenses only!',
      ),
      Question(
        id: 'save_q5',
        question: 'Which is a good saving goal for a teenager?',
        options: [
          'A new gaming console or phone',
          'Buying expensive designer clothes weekly',
          'Saving for college',
          'Both A and C are good goals'
        ],
        correctAnswerIndex: 3,
        explanation:
            'All goals are valid! Both short-term (console) and long-term (college) goals are important!',
      ),
    ],
  ),

  /// Topic 2: Budgeting
  Topic(
    id: 'budgeting',
    title: 'Budgeting',
    description: 'Master the art of managing your money wisely!',
    icon: '📋',
    flashCards: [
      FlashCard(
        id: 'budget_1',
        term: 'Budget',
        definition:
            'A plan for how you will spend and save your money each month.',
      ),
      FlashCard(
        id: 'budget_2',
        term: 'Income',
        definition: 'Money you earn from a job, allowance, or other sources.',
      ),
      FlashCard(
        id: 'budget_3',
        term: 'Expenses',
        definition:
            'Money you spend on things like food, entertainment, or clothes.',
      ),
      FlashCard(
        id: 'budget_4',
        term: '50/30/20 Rule',
        definition:
            '50% for needs, 30% for wants, 20% for savings and debt payment.',
      ),
    ],
    questions: [
      Question(
        id: 'budget_q1',
        question: 'What is the main purpose of a budget?',
        options: [
          'To spend as much money as possible',
          'To track income and expenses to control spending',
          'To make money disappear',
          'To impress other people'
        ],
        correctAnswerIndex: 1,
        explanation:
            'A budget helps you control your money and reach your financial goals!',
      ),
      Question(
        id: 'budget_q2',
        question: 'Which of these is an example of income?',
        options: [
          'Buying groceries',
          'Paying for electricity',
          'Earning allowance from parents',
          'Watching movies'
        ],
        correctAnswerIndex: 2,
        explanation:
            'Income is money coming in, like an allowance or wages from a job!',
      ),
      Question(
        id: 'budget_q3',
        question: 'In the 50/30/20 rule, what does 50% cover?',
        options: [
          'Entertainment and fun',
          'Savings and investments',
          'Needs like food and housing',
          'Gifts for friends'
        ],
        correctAnswerIndex: 2,
        explanation: 'Needs (50%) are essential things you must have to live!',
      ),
      Question(
        id: 'budget_q4',
        question: 'What should you do if you spend more than your income?',
        options: [
          'Ignore it and keep spending',
          'Borrow money from friends',
          'Review your budget and reduce spending',
          'Just hope it fixes itself'
        ],
        correctAnswerIndex: 2,
        explanation:
            'Always adjust your budget when you spend more than you earn!',
      ),
      Question(
        id: 'budget_q5',
        question: 'How often should you review your budget?',
        options: [
          'Never, set it once and forget it',
          'Once a year',
          'Monthly or as needed',
          'Only when you have a problem'
        ],
        correctAnswerIndex: 2,
        explanation:
            'Regular budget reviews help you stay on track and make adjustments!',
      ),
    ],
  ),

  /// Topic 3: Needs vs Wants
  Topic(
    id: 'needs_vs_wants',
    title: 'Needs vs Wants',
    description:
        'Understand the difference between what you need and what you want!',
    icon: '🎯',
    flashCards: [
      FlashCard(
        id: 'nvw_1',
        term: 'Needs',
        definition:
            'Essential things required for survival like food, water, shelter, and clothing.',
      ),
      FlashCard(
        id: 'nvw_2',
        term: 'Wants',
        definition:
            'Things you would like to have but do not need to survive, like toys or games.',
      ),
      FlashCard(
        id: 'nvw_3',
        term: 'Priority',
        definition:
            'Deciding which is more important - always focus on needs before wants.',
      ),
      FlashCard(
        id: 'nvw_4',
        term: 'Impulse Buying',
        definition:
            'Buying something suddenly without planning - often results in poor spending choices.',
      ),
    ],
    questions: [
      Question(
        id: 'nvw_q1',
        question: 'Which is a need?',
        options: [
          'A new video game',
          'A vacation trip',
          'Food to eat',
          'A designer backpack'
        ],
        correctAnswerIndex: 2,
        explanation: 'Food is a need - you cannot survive without eating!',
      ),
      Question(
        id: 'nvw_q2',
        question: 'Which is a want?',
        options: [
          'A warm bed to sleep in',
          'Drinking water',
          'The latest smartphone model',
          'Shelter from bad weather'
        ],
        correctAnswerIndex: 2,
        explanation:
            'A smartphone is a want - you want it but do not need it to survive!',
      ),
      Question(
        id: 'nvw_q3',
        question: 'What should you prioritize in your budget?',
        options: [
          'Always buy wants first',
          'Ignore needs and focus on wants',
          'Satisfy needs before spending on wants',
          'Never buy anything'
        ],
        correctAnswerIndex: 2,
        explanation:
            'Always make sure your needs are covered before spending on wants!',
      ),
      Question(
        id: 'nvw_q4',
        question: 'What is impulse buying?',
        options: [
          'Planning your purchases carefully',
          'Buying something suddenly without thinking',
          'Saving money for later',
          'Comparing prices before buying'
        ],
        correctAnswerIndex: 1,
        explanation:
            'Impulse buying is buying without planning - avoid this by making a list first!',
      ),
      Question(
        id: 'nvw_q5',
        question:
            'You have \$50. You need new school supplies (\$20). The rest can go toward wants. How much can you spend on wants?',
        options: ['\$10', '\$20', '\$30', '\$50'],
        correctAnswerIndex: 2,
        explanation:
            'After covering your need (\$20), you have \$30 left to spend on wants!',
      ),
    ],
  ),

  /// Topic 4: Credit Basics
  Topic(
    id: 'credit_basics',
    title: 'Credit Basics',
    description: 'Learn about credit and how to build good credit habits!',
    icon: '💳',
    flashCards: [
      FlashCard(
        id: 'credit_1',
        term: 'Credit',
        definition:
            'Borrowing money with the promise to pay it back later, usually with interest.',
      ),
      FlashCard(
        id: 'credit_2',
        term: 'Credit Card',
        definition:
            'A card that lets you borrow money from a bank to buy things now and pay later.',
      ),
      FlashCard(
        id: 'credit_3',
        term: 'Credit Score',
        definition:
            'A number (300-850) that shows how likely you are to repay borrowed money.',
      ),
      FlashCard(
        id: 'credit_4',
        term: 'Interest Rate',
        definition:
            'The percentage of borrowed money charged as a fee for the loan.',
      ),
    ],
    questions: [
      Question(
        id: 'credit_q1',
        question: 'What does it mean to use credit?',
        options: [
          'Borrowing money to pay back later',
          'Giving money away',
          'Losing all your savings',
          'Never spending money'
        ],
        correctAnswerIndex: 0,
        explanation:
            'Credit is when you borrow money with a promise to repay it!',
      ),
      Question(
        id: 'credit_q2',
        question: 'Why do credit cards charge interest?',
        options: [
          'To be mean to customers',
          'Because the bank is lending you money',
          'To make prices higher',
          'By random chance'
        ],
        correctAnswerIndex: 1,
        explanation: 'Interest is the cost of borrowing money from the bank!',
      ),
      Question(
        id: 'credit_q3',
        question: 'How can you build a good credit score?',
        options: [
          'Never use credit',
          'Pay your debts on time',
          'Use credit cards for everything',
          'Ignore your bills'
        ],
        correctAnswerIndex: 1,
        explanation: 'Paying on time is the key to building good credit!',
      ),
      Question(
        id: 'credit_q4',
        question:
            'If you borrow \$100 with a 10% interest rate, how much do you owe back?',
        options: ['\$90', '\$100', '\$110', '\$120'],
        correctAnswerIndex: 2,
        explanation: 'You owe \$100 plus 10% interest (\$10) = \$110 total!',
      ),
      Question(
        id: 'credit_q5',
        question: 'What is a credit score?',
        options: [
          'How much money you have',
          'A number that shows if you can repay borrowed money',
          'Your age in numbers',
          'How many friends you have'
        ],
        correctAnswerIndex: 1,
        explanation:
            'A credit score (300-850) shows lenders how responsible you are with money!',
      ),
    ],
  ),

  /// Topic 5: Money Goals
  Topic(
    id: 'money_goals',
    title: 'Money Goals',
    description: 'Set and achieve your financial goals!',
    icon: '🎪',
    flashCards: [
      FlashCard(
        id: 'goals_1',
        term: 'Short-Term Goal',
        definition:
            'A financial goal you want to achieve within 1 year, like saving for a bike.',
      ),
      FlashCard(
        id: 'goals_2',
        term: 'Long-Term Goal',
        definition:
            'A financial goal that takes years to achieve, like saving for college.',
      ),
      FlashCard(
        id: 'goals_3',
        term: 'SMART Goal',
        definition:
            'A goal that is Specific, Measurable, Achievable, Relevant, and Time-bound.',
      ),
      FlashCard(
        id: 'goals_4',
        term: 'Net Worth',
        definition:
            'The difference between all your assets and all your debts.',
      ),
    ],
    questions: [
      Question(
        id: 'goals_q1',
        question: 'Which is an example of a short-term financial goal?',
        options: [
          'Saving money for college',
          'Saving \$50 for a new game in 3 months',
          'Building a career',
          'Buying a house'
        ],
        correctAnswerIndex: 1,
        explanation: 'Short-term goals are achievable within a year!',
      ),
      Question(
        id: 'goals_q2',
        question: 'What makes a goal SMART?',
        options: [
          'It is written down',
          'It is Specific, Measurable, Achievable, Relevant, and Time-bound',
          'It is always about saving',
          'It is about spending money'
        ],
        correctAnswerIndex: 1,
        explanation: 'SMART goals are clear and have a deadline!',
      ),
      Question(
        id: 'goals_q3',
        question: 'Why is setting financial goals important?',
        options: [
          'To complicate your life',
          'To give direction to your spending and saving',
          'Because adults say so',
          'It is not important'
        ],
        correctAnswerIndex: 1,
        explanation:
            'Goals give you direction and help you make better financial decisions!',
      ),
      Question(
        id: 'goals_q4',
        question:
            'You want to buy a \$200 bike in 5 months. How much should you save per month?',
        options: ['\$20', '\$30', '\$40', '\$50'],
        correctAnswerIndex: 2,
        explanation:
            '\$200 ÷ 5 months = \$40 per month. That is your savings goal!',
      ),
      Question(
        id: 'goals_q5',
        question: 'What is net worth?',
        options: [
          'How much money you spend',
          'The difference between what you own and what you owe',
          'Your salary',
          'How many things you have'
        ],
        correctAnswerIndex: 1,
        explanation:
            'Net worth = Assets - Debts. It shows your overall financial health!',
      ),
    ],
  ),
];
