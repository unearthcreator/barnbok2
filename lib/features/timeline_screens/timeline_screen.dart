import 'package:flutter/material.dart';
import 'package:barnbok/models/card_info.dart';

class TimelineScreen extends StatelessWidget {
  final CardInfo cardInfo;

  const TimelineScreen({super.key, required this.cardInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timeline for ${cardInfo.surname}')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('UUID: ${cardInfo.uniqueId}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('First name: ${cardInfo.surname}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Last name: ${cardInfo.lastName ?? 'N/A'}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Image path: ${cardInfo.imagePath}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Position index: ${cardInfo.positionIndex}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Server ID: ${cardInfo.serverId ?? 'N/A'}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}