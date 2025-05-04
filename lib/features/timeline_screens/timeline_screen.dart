import 'package:flutter/material.dart';
import 'package:barnbok/models/card_info.dart';

class TimelineScreen extends StatefulWidget {
  final CardInfo cardInfo;

  const TimelineScreen({super.key, required this.cardInfo});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  late DateTime startDate;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();
    endDate = DateTime.now();
    startDate = DateTime.now().subtract(const Duration(days: 270));
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startDate : endDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != (isStartDate ? startDate : endDate)) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center( // Wrap with Center to ensure centering in both orientations
          child: isLandscape
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // Changed to start to align the line with date below
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 25,
                              width: 3,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 8), // Increased spacing
                            GestureDetector(
                              onTap: () => _selectDate(context, true),
                              child: Text(
                                '${startDate.toLocal()}'.split(' ')[0],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            height: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 25,
                              width: 3,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 8), // Increased spacing
                            GestureDetector(
                              onTap: () => _selectDate(context, false),
                              child: Text(
                                '${endDate.toLocal()}'.split(' ')[0],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : SizedBox(
                  width: 50, // Fixed width for the portrait timeline
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center, // Center alignment
                    children: [
                      GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: Text(
                          '${endDate.toLocal()}'.split(' ')[0],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: Text(
                          '${startDate.toLocal()}'.split(' ')[0],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}