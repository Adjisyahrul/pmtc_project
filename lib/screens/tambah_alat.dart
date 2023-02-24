import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pmtc_project/model/alat.dart';
import 'package:pmtc_project/utils/colors.dart';
import 'package:pmtc_project/utils/font.dart';
import 'package:pmtc_project/widget/container_pembatas.dart';

import '../constants/alat.dart';
import '../widget/date_picker.dart';
import 'home.dart';

class TambahAlat extends StatefulWidget {
  const TambahAlat({Key? key}) : super(key: key);

  @override
  State<TambahAlat> createState() => _TambahAlatState();
}

class _TambahAlatState extends State<TambahAlat> {
  String dropdownValueJenisalat = KategoriAlat.first;
  String dropdownValueJenisPemeriksaan = IntervalPemeriksaan.entries.first.key;

  final namaAlatController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    namaAlatController.dispose();
  }

  final alatRef =
      FirebaseFirestore.instance.collection('alat').withConverter<Alat>(
            fromFirestore: (snapshot, _) => Alat.fromJson(snapshot.data()!),
            toFirestore: (alat, _) => alat.toJson(),
          );

  Future submit() async {
    if (namaAlatController.text.isEmpty) {
      return;
    }

    await alatRef.add(
      Alat(
          nama: namaAlatController.text,
          kategori: namaAlatController.text,
          interval: "Daily",
          pic: namaAlatController.text,
          kreator: namaAlatController.text,
          action: ["a"],
          gambar: namaAlatController.text),
    );
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
        padding: EdgeInsets.only(top: 8, bottom: 30),
        children: [
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 16, left: 24, right: 25, bottom: 16),
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
                          margin: EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(abu_abu_textField)),
                          padding:
                              EdgeInsets.only(left: 8, top: 12, bottom: 11),
                          child: TextField(
                            controller: namaAlatController,
                            style: fontLatoSubJudul,
                            decoration: InputDecoration(
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
                          margin: EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(abu_abu_textField)),
                          padding: EdgeInsets.only(
                              left: 10, top: 12, bottom: 11, right: 10),
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            value: dropdownValueJenisalat,
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
                                dropdownValueJenisalat = value!;
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
                          margin: EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(abu_abu_textField)),
                          padding: EdgeInsets.only(
                              left: 10, top: 12, bottom: 11, right: 10),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                label: Text(
                              "Jenis Pemeriksaan",
                              style: fontLatoIsi,
                            )),
                            isExpanded: true,
                            value: dropdownValueJenisPemeriksaan,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValueJenisPemeriksaan = value!;
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
              container_pembatas,
              Container(
                padding:
                    EdgeInsets.only(top: 16, left: 24, right: 25, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Penanggung Jawab",
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
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(abu_abu_textField)),
                          padding: EdgeInsets.only(
                              left: 10, top: 12, bottom: 11, right: 10),
                          child: TextField(
                            style: fontLatoSubJudul,
                            decoration: InputDecoration(
                              hintText: "Nama Penanggungjawab",
                            ),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              container_pembatas,
              Container(
                padding:
                    EdgeInsets.only(top: 16, left: 24, right: 25, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            "Penanggung Jawab",
                            style: fontLatoJudul,
                          ),
                        ),
                      ],
                    ),
                    DatePicker()
                  ],
                ),
              ),
              container_pembatas,
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
                                child: ActionSection())),
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
              container_pembatas,
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
