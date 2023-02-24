import 'package:cloud_firestore/cloud_firestore.dart';

class Notif {
  final String id;
  final DateTime timestamp;

  Notif({
    required this.id,
    required this.timestamp,
  });

  Notif.fromJson(Map<String, Object?> json)
      : this(
    id: json['id']! as String,
    timestamp: (json['timestamp']! as Timestamp).toDate(),
  );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'timestamp': Timestamp.now(),
    };
  }
}
