import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/alat.dart';
import '../widget/alat_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
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
                      hintText: "Cari Alat",
                      border: InputBorder.none),
                ),
              ),
              const Text(
                "Tenggat Waktu Pemeriksaan",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('alat')
                      .withConverter<Alat>(
                        fromFirestore: (snapshot, _) =>
                            Alat.fromJson(snapshot.data()!),
                        toFirestore: (alat, _) => alat.toJson(),
                      )
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Alat>> snapshot) {
                    if (!snapshot.hasData) return Text('Loading...');

                    final docs = snapshot.data!.docs;
                    return Expanded(
                        child: ListView.builder(
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              final alat = docs[index].data();
                              return AlatCard(alat: alat);
                            }));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
