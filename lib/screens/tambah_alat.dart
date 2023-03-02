import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pmtc_project/model/alat.dart';
import 'package:pmtc_project/utils/colors.dart';
import 'package:pmtc_project/utils/font.dart';
import 'package:pmtc_project/widget/divider.dart';

import '../constants/alat.dart';

class TambahAlat extends StatefulWidget {
  const TambahAlat({Key? key}) : super(key: key);

  @override
  State<TambahAlat> createState() => _TambahAlatState();
}

class _TambahAlatState extends State<TambahAlat> {
  final namaController = TextEditingController();

  String kategori = KategoriAlat.first;
  String interval = IntervalPemeriksaan.entries.first.key;

  final picController = TextEditingController();

  final actionController = TextEditingController();
  List<String> actions = [];

  final alatRef =
      FirebaseFirestore.instance.collection('alat').withConverter<Alat>(
            fromFirestore: (snapshot, _) =>
                Alat.fromJson(snapshot.id, snapshot.data()!),
            toFirestore: (alat, _) => alat.toJson(),
          );

  void addAction() {
    if (actionController.text.isEmpty) return;

    setState(() {
      actions.add(actionController.text);
    });
    actionController.clear();
  }

  void removeAction(int index) {
    setState(() {
      actions.removeAt(index);
    });
  }

  Future submit() async {
    if (namaController.text.isEmpty) {
      return;
    }

    await alatRef.add(
      Alat(
          nama: namaController.text,
          kategori: kategori,
          interval: interval,
          pic: picController.text,
          kreator: FirebaseAuth.instance.currentUser?.displayName ?? "",
          action: actions,
          gambar: namaController.text),
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Berhasil!")));

    setState(() {
      namaController.text = "";
      kategori = KategoriAlat.first;
      interval = IntervalPemeriksaan.entries.first.key;
      picController.text = "";
      actions = [];
    });
  }

  @override
  void dispose() {
    super.dispose();
    namaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Alat",
          style: fontLatoJudul,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 30),
        children: [
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 16, left: 24, right: 25, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Deskripsi Alat",
                          style: fontLatoJudul,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(abu_abu_textField)),
                          padding: const EdgeInsets.only(
                              left: 8, top: 12, bottom: 11),
                          child: TextField(
                            controller: namaController,
                            style: fontLatoSubJudul,
                            decoration: const InputDecoration(
                              hintText: "Nama Alat",
                            ),
                          ),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(abu_abu_textField)),
                          padding: const EdgeInsets.only(
                              left: 10, top: 12, bottom: 11, right: 10),
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            value: kategori,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                label: Text(
                              "Kategori Alat",
                              style: fontLatoIsi,
                            )),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                kategori = value!;
                              });
                            },
                            items: KategoriAlat.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(abu_abu_textField)),
                          padding: const EdgeInsets.only(
                              left: 10, top: 12, bottom: 11, right: 10),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                label: Text(
                              "Jenis Pemeriksaan",
                              style: fontLatoIsi,
                            )),
                            isExpanded: true,
                            value: interval,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                interval = value!;
                              });
                            },
                            items: IntervalPemeriksaan.entries
                                .map((MapEntry<String, int> entry) {
                              return DropdownMenuItem(
                                value: entry.key,
                                child: Text(entry.key),
                              );
                            }).toList(),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              divider,
              Container(
                padding: const EdgeInsets.only(
                    top: 16, left: 24, right: 25, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "PIC",
                          style: fontLatoJudul,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(abu_abu_textField)),
                          padding: const EdgeInsets.only(
                              left: 10, top: 12, bottom: 11, right: 10),
                          child: TextField(
                            controller: picController,
                            style: fontLatoSubJudul,
                            decoration: const InputDecoration(
                              hintText: "Nama PIC",
                            ),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              divider,
              Container(
                padding: EdgeInsets.only(top: 16, left: 24, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Action",
                          style: fontLatoJudul,
                        )
                      ],
                    ),
                    ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: actions.asMap().entries.map((entry) {
                        return Row(
                          children: [
                            Text(entry.value),
                            IconButton(
                                onPressed: () {
                                  removeAction(entry.key);
                                },
                                icon: Icon(Icons.close))
                          ],
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(top: 14),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Color(abu_abu_textField)),
                                padding: EdgeInsets.only(
                                    left: 10, top: 12, bottom: 15, right: 10),
                                child: TextField(
                                  controller: actionController,
                                  decoration: InputDecoration(
                                      hintText: "Action yang perlu ditambahkan",
                                      border: InputBorder.none),
                                ))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(top: 14),
                          padding:
                              EdgeInsets.only(left: 10, bottom: 15, right: 10),
                          child: TextButton(
                            onPressed: addAction,
                            style: TextButton.styleFrom(
                                side: BorderSide(
                                  color: Colors.blueAccent,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Tambahkan Action",
                                  style: fontLatoSubJudul,
                                )
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              divider,
              Container(
                padding: EdgeInsets.only(top: 16, left: 24, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Upload gambar",
                          style: fontLatoJudul,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(top: 14),
                          padding: EdgeInsets.only(
                              left: 10, top: 12, bottom: 15, right: 10),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                side: BorderSide(
                                  color: Colors.blueAccent,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Tambahkan Foto",
                                  style: fontLatoSubJudul,
                                )
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(top: 14),
                          padding:
                              EdgeInsets.only(left: 10, bottom: 15, right: 10),
                          child: ElevatedButton(
                              onPressed: submit,
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                              child: Center(
                                child: Text(
                                  "Tambahkan Data",
                                  style: fontLatoIsi,
                                ),
                              )),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
