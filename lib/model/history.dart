import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  final DateTime timestamp;
  final List<bool> action;
  final String pemeriksa;
  final String deskripsi;

  History({
    required this.timestamp,
    required this.action,
    required this.pemeriksa,
    required this.deskripsi,
  });

  History.fromJson(Map<String, Object?> json)
      : this(
          timestamp: (json['timestamp']! as Timestamp).toDate(),
          action: (json['action']! as List<dynamic>).map((a) {
            return a as bool;
          }).toList(),
          pemeriksa: json['pemeriksa']! as String,
          deskripsi: json['deskripsi']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'timestamp': Timestamp.now(),
      'action': action,
      'pemeriksa': pemeriksa,
      'deskripsi': deskripsi,
    };
  }
}
