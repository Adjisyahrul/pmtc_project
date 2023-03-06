import 'package:cloud_firestore/cloud_firestore.dart';

class Perusahaan {
  final String? id;
  final String nama;
  final String alamat;
  final String pic;
  final String deskripsi;

  final String onProcess;
  final String delivered;
  final String returned;

  final String? keterangan;
  final DateTime? deadline;

  Perusahaan(
      {this.id,
      required this.nama,
      required this.alamat,
      required this.pic,
      required this.deskripsi,
      required this.onProcess,
      required this.delivered,
      required this.returned,
      this.keterangan,
      this.deadline});

  Perusahaan.fromJson(String id, Map<String, Object?> json)
      : this(
          id: id,
          nama: json['nama']! as String,
          alamat: json['alamat']! as String,
          pic: json['pic']! as String,
          deskripsi: json['deskripsi']! as String,
          onProcess: json['onProcess']! as String,
          delivered: json['delivered']! as String,
          returned: json['returned']! as String,
          keterangan: json['keterangan'] as String,
          deadline: json['deadline'] != null
              ? DateTime.parse(
                  (json['deadline']! as Timestamp).toDate().toString())
              : null,
        );

  Map<String, Object?> toJson() {
    return {
      'nama': nama,
      'alamat': alamat,
      'pic': pic,
      'deskripsi': deskripsi,
      'onProcess': onProcess,
      'delivered': delivered,
      'returned': returned,
      'keterangan': keterangan,
      'deadline': deadline != null ? Timestamp.fromDate(deadline!) : null,
    };
  }
}
