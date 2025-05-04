import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barnbok/models/card_info.dart';
import 'package:barnbok/features/timeline_screens/timeline_screen.dart';

class FirstTimelineScreen extends StatelessWidget {
  final CardInfo cardInfo;

  const FirstTimelineScreen({super.key, required this.cardInfo});

  Future<void> _completeTutorialAndContinue(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenTimelineTutorial', true);

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (_) => TimelineScreen(cardInfo: cardInfo),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Getting Started')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Turn your phone for landscape view and select a theme!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _completeTutorialAndContinue(context),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}