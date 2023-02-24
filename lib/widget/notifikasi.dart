import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmtc_project/model/notif.dart';
import 'package:pmtc_project/screens/alat_screen.dart';
import 'package:pmtc_project/utils/font.dart';

import '../model/alat.dart';

class Notifikasi extends StatelessWidget {
  final Notif notif;
  const Notifikasi({Key? key, required this.notif}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("alat")
            .doc(notif.id)
            .withConverter<Alat>(
              fromFirestore: (snapshot, _) =>
                  Alat.fromJson(snapshot.id, snapshot.data()!),
              toFirestore: (alat, _) => alat.toJson(),
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading...");
          }

          final alat = snapshot.data!.data()!;
          return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        AlatScreenController(alatId: notif.id)));
              },
              child: Expanded(
                  child: Container(
                margin: EdgeInsets.only(bottom: 8),
                padding:
                    EdgeInsets.only(left: 8, top: 10, right: 8, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1)),
                child: Text(
                  "${alat.nama} pada Pemeriksaan ${alat.interval} telah diupdate dan diperiksa pada ${DateFormat("dd/MM/yyyy hh:mm:ss").format(notif.timestamp)}",
                  style: fontLatoIsi,
                  overflow: TextOverflow.clip,
                ),
              )));
        });
  }
}
