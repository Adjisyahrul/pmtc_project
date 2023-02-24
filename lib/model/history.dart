import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  final DateTime timestamp;
  final List<bool> action;

  History({
    required this.timestamp,
    required this.action,
  });

  History.fromJson(Map<String, Object?> json)
      : this(
          timestamp: (json['timestamp']! as Timestamp).toDate(),
          action: (json['action']! as List<dynamic>).map((a) {
            return a as bool;
          }).toList(),
        );

  Map<String, Object?> toJson() {
    return {
      'timestamp': timestamp,
      'action': action,
    };
  }
}
