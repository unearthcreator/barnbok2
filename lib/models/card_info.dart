// lib/models/card_info.dart

import 'package:hive/hive.dart';

part 'card_info.g.dart';

@HiveType(typeId: 0)
class CardInfo extends HiveObject {

  @HiveField(0)
  String uniqueId;

  @HiveField(1)
  String surname;

  @HiveField(2)
  String? lastName;

  @HiveField(3)
  String imagePath;

  @HiveField(4)
  int positionIndex;

  @HiveField(5)
  String? serverId;

  // --- NEW FIELD: Theme color stored as integer ---
  @HiveField(6)
  int themeColorValue;

  CardInfo({
    required this.uniqueId,
    required this.surname,
    this.lastName,
    required this.imagePath,
    required this.positionIndex,
    this.serverId,
    required this.themeColorValue, // <-- Added this
  });

  @override
  String toString() {
    return 'CardInfo(uniqueId: $uniqueId, surname: $surname, lastName: ${lastName ?? "N/A"}, imagePath: $imagePath, positionIndex: $positionIndex, serverId: $serverId, themeColorValue: $themeColorValue)';
  }
}