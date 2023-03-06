import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pmtc_project/model/perusahaan.dart';
import 'package:pmtc_project/widget/perusahaan_card.dart';
import '../model/alat.dart';
import 'perusahaan_screen.dart';

class DashboardMarketing extends StatelessWidget {
  const DashboardMarketing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              padding: const EdgeInsets.only(left: 10),
              child: const TextField(
                enableSuggestions: false,
                decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Cari Perusahaan",
                    border: InputBorder.none),
              ),
            ),
            const Text(
              "List Perusahaan",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('perusahaan')
                    .withConverter<Perusahaan>(
                  fromFirestore: (snapshot, _) =>
                      Perusahaan.fromJson(snapshot.id, snapshot.data()!),
                  toFirestore: (perusahaan, _) => perusahaan.toJson(),
                )
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Perusahaan>> snapshot) {
                  if (!snapshot.hasData) return Text('Loading...');


                  final docs = snapshot.data!.docs;
                  return Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            final perusahaan = docs[index].data();
                            return PerusahaanCard(perusahaan: perusahaan);
                          }));
                }),
          ],
        ),
      ),
    );
  }
}