import 'package:flutter/material.dart';
import 'package:barnbok/models/card_info.dart';

class TimelineScreen extends StatelessWidget {
  final CardInfo cardInfo;

  const TimelineScreen({super.key, required this.cardInfo});

  String getThemeColorName(int colorValue) {
    switch (colorValue) {
      case 0xFF03A9F4:
        return 'Light Blue';
      case 0xFFE91E63:
        return 'Pink';
      case 0xFF9C27B0:
        return 'Purple';
      case 0xFF4CAF50:
        return 'Green';
      case 0xFFF44336:
        return 'Red';
      case 0xFFFF9800:
        return 'Orange';
      case 0xFF2196F3:
        return 'Blue';
      case 0xFF000000:
        return 'Black';
      default:
        return 'Unknown Color';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timeline for ${cardInfo.surname}')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('UUID: ${cardInfo.uniqueId}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('First name: ${cardInfo.surname}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Last name: ${cardInfo.lastName ?? 'N/A'}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Image path: ${cardInfo.imagePath}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Position index: ${cardInfo.positionIndex}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Server ID: ${cardInfo.serverId ?? 'N/A'}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Theme color: ${getThemeColorName(cardInfo.themeColorValue)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
