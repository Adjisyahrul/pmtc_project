// import 'package:pmtc_project/model/history.dart';
//
// class Alat {
//   final String? id;
//   final String nama;
//   final String kategori;
//   final String interval;
//
//   final String pic;
//   final String kreator;
//
//   final List<String> action;
//   final String gambar;
//
//   final List<History>? history;
//
//   Alat(
//       {this.id,
//         required this.nama,
//         required this.kategori,
//         required this.interval,
//         required this.pic,
//         required this.kreator,
//         required this.action,
//         required this.gambar,
//         this.history});
//
//   Alat.fromJson(String id, Map<String, Object?> json)
//       : this(
//     id: id,
//     nama: json['nama']! as String,
//     kategori: json['kategori']! as String,
//     interval: json['interval']! as String,
//     pic: json['pic']! as String,
//     kreator: json['kreator']! as String,
//     action: (json['action']! as List<dynamic>).map((a) {
//       return a.toString();
//     }).toList(),
//     gambar: json['gambar']! as String,
//     history: (json['history'] as List<dynamic>?)?.map((h) {
//       return History.fromJson(h);
//     }).toList(),
//   );
//
//   Map<String, Object?> toJson() {
//     return {
//       'nama': nama,
//       'kategori': kategori,
//       'interval': interval,
//       'pic': pic,
//       'kreator': kreator,
//       'action': action,
//       'gambar': gambar,
//       'history': history?.map((h) {
//         return h.toJson();
//       })
//     };
//   }
// }
