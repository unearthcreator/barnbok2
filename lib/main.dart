// main.dart - UPDATED VERSION WITH TEMPORARY TUTORIAL FLAG RESET AND STATUS BAR REMOVAL

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Added for status bar control
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import your project files (!!! ADJUST PATHS AS NEEDED !!!)
import 'core/shared/services/error_handler.dart';
import 'core/app.dart';
import 'models/card_info.dart';
import 'repositories/hive_card_data_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Flutter Widgets Initialized.');

  // Hide status bar globally
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  try {
    print('Initializing Hive...');
    await Hive.initFlutter();
    print('Hive Initialized.');

    print('Registering CardInfoAdapter...');
    Hive.registerAdapter(CardInfoAdapter());
    print('CardInfoAdapter Registered.');

    print('Opening Hive Box: "${HiveCardDataRepository.boxName}"...');
    await Hive.openBox<CardInfo>(HiveCardDataRepository.boxName);
    print('Hive Box "${HiveCardDataRepository.boxName}" opened successfully.');

    print('Initializing SharedPreferences...');
    final prefs = await SharedPreferences.getInstance();

    // --- TEMPORARY FOR TESTING: Reset tutorial flag EVERY RUN ---
    await prefs.setBool('hasSeenTimelineTutorial', false);
    print('Tutorial preference temporarily reset to false (FOR TESTING ONLY).');
    // -------------------------------------------------------------

  } catch (e, stackTrace) {
    print('FATAL ERROR during app initialization: $e\n$stackTrace');
    // ErrorHandler.logError('App Initialization Failed', e, stackTrace);
  }

  ErrorHandler.initialize();
  print('Global Error Handler Initialized.');

  print('Running the App...');
  runApp(const MyApp());
}