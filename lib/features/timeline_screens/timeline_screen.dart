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
      appBar: AppBar(title: Text('Timeline for ${widget.cardInfo.surname}')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLandscape
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: Column(
                          children: [
                            Text('${startDate.toLocal()}'.split(' ')[0],
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Icon(Icons.location_on),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: Column(
                          children: [
                            Text('${endDate.toLocal()}'.split(' ')[0],
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Icon(Icons.location_on),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _selectDate(context, false),
                    child: Column(
                      children: [
                        const Icon(Icons.location_on),
                        Text('${endDate.toLocal()}'.split(' ')[0],
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
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
                    child: Column(
                      children: [
                        const Icon(Icons.location_on),
                        Text('${startDate.toLocal()}'.split(' ')[0],
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}