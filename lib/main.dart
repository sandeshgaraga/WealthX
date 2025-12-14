/// Main App Entry Point
/// Configures the Flutter app with providers and theme management

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'services/local_storage_service.dart';
import 'services/user_data_provider.dart';
import 'services/theme_provider.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage
  final storageService = LocalStorageService();
  await storageService.init();

  // Initialize user data provider
  final userDataProvider = UserDataProvider();
  await userDataProvider.init(storageService);

  // Get saved theme
  final savedTheme = storageService.getActiveTheme();

  runApp(
    MoneyQuestApp(
      storageService: storageService,
      userDataProvider: userDataProvider,
      initialTheme: savedTheme,
    ),
  );
}

class MoneyQuestApp extends StatelessWidget {
  final LocalStorageService storageService;
  final UserDataProvider userDataProvider;
  final String initialTheme;

  const MoneyQuestApp({
    Key? key,
    required this.storageService,
    required this.userDataProvider,
    required this.initialTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provide user data
        ChangeNotifierProvider.value(value: userDataProvider),
        // Provide theme
        ChangeNotifierProvider(
          create: (_) => ThemeProvider()..initializeTheme(initialTheme),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'MoneyQuest',
            theme: themeProvider.themeData,
            home: const HomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
