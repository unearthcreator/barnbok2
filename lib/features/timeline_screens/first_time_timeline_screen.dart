import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barnbok/models/card_info.dart';
import 'package:barnbok/features/timeline_screens/timeline_screen.dart';

class FirstTimelineScreen extends StatefulWidget {
  final CardInfo cardInfo;

  const FirstTimelineScreen({super.key, required this.cardInfo});

  @override
  State<FirstTimelineScreen> createState() => _FirstTimelineScreenState();
}

class _FirstTimelineScreenState extends State<FirstTimelineScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Color _selectedColor = Colors.lightBlue;

  final List<List<Color>> _themeColors = [
    [Colors.lightBlue, Colors.pink, Colors.purple, Colors.green],
    [Colors.red, Colors.orange, Colors.blue, Colors.black],
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _completeTutorialAndContinue(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenTimelineTutorial', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => TimelineScreen(cardInfo: widget.cardInfo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Getting Started')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
              child: Column(
                children: [
                  RotationTransition(
                    turns: _controller,
                    child: const Icon(Icons.screen_rotation, size: 40),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Phone can now be turned\nin landscape mode as well',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Select a theme:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          for (var rowColors in _themeColors)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rowColors.map((color) {
                final bool isSelected = _selectedColor == color;
                final bool isBlack = color == Colors.black;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: isBlack ? Colors.white : Colors.black, width: 3)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => _completeTutorialAndContinue(context),
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
