import '/widget/divider.dart';
import '/utils/font.dart';

import '/utils/colors.dart';
import 'package:flutter/material.dart';

const List<String>SPKSudahKirim = <String>[
  "Sudah",
  "Belum",
  "Revisi",
];

const List<String>SPKYangSudahKembali = <String>[
  "Sudah",
  "Belum",
  "Revisi",
];

const List<String>SPKOnProcess = <String>[
  "ok",
  "no",
];


class TambahPerusahaan extends StatefulWidget {
  const TambahPerusahaan({Key? key}) : super(key: key);

  @override
  State<TambahPerusahaan> createState() => _TambahPerusahaanState();
}

class _TambahPerusahaanState extends State<TambahPerusahaan> {
  String dropdownValueSPKSudahKirim = SPKSudahKirim.first;
  String dropdownValueSPKOnProcess = SPKOnProcess.first;
  String dropdownValueSPKYangSudahKembali = SPKYangSudahKembali.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input Perusahaan",
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
                                "Nama Perusahaan",
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
                                      style: fontLatoSubJudul,
                                      decoration: InputDecoration(
                                        hintText: "Nama Perusahaan",
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Alamat Perusahaan",
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
                                      style: fontLatoSubJudul,
                                      decoration: InputDecoration(
                                        hintText: "Alamat Perusahaan",
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "PIC Perusahaan",
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
                                      style: fontLatoSubJudul,
                                      decoration: InputDecoration(
                                        hintText: "PIC Perusahaan",
                                      ),
                                    ),
                                  )),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Deadline",
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
                                      style: fontLatoSubJudul,
                                      decoration: InputDecoration(
                                        hintText: "Deadline",
                                      ),
                                    ),
                                  )),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Deskripsi Tambahan",
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
                                      style: fontLatoSubJudul,
                                      decoration: InputDecoration(
                                        hintText: "Deskripsi Tambahan",
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
                                "SPK On Process",
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
                                    child: DropdownButtonFormField<String>(
                                      isExpanded: true,
                                      value: dropdownValueSPKOnProcess,
                                      elevation: 16,
                                      style: const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          label: Text(
                                            "Pilih Hasil",
                                            style: fontLatoIsi,
                                          )),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          dropdownValueSPKOnProcess = value!;
                                        });
                                      },
                                      items: SPKOnProcess
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                                "SPK Yang Sudah Dikirim",
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
                                    child: DropdownButtonFormField<String>(
                                      isExpanded: true,
                                      value: dropdownValueSPKSudahKirim,
                                      elevation: 16,
                                      style: const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          label: Text(
                                            "Pilih Hasil",
                                            style: fontLatoIsi,
                                          )),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          dropdownValueSPKSudahKirim = value!;
                                        });
                                      },
                                      items: SPKSudahKirim
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                                "SPK Yang Sudah Kembali",
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
                                    child: DropdownButtonFormField<String>(
                                      isExpanded: true,
                                      value: dropdownValueSPKYangSudahKembali,
                                      elevation: 16,
                                      style: const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          label: Text(
                                            "Pilih Hasil",
                                            style: fontLatoIsi,
                                          )),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          dropdownValueSPKYangSudahKembali= value!;
                                        });
                                      },
                                      items: SPKYangSudahKembali
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16, left: 24, right: 25, bottom: 16),
                      child:
                      Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Keterangan",
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
                                      style: fontLatoSubJudul,
                                      decoration: InputDecoration(
                                        hintText: "Keterangan",
                                      ),
                                    ),
                                  )),
                            ],
                          ),

                        ],
                      )
                      ,
                    ),

                    Center(
                      child:
                      Expanded(child:
                      ElevatedButton(onPressed: (){},
                        child: Text("Simpan"),
                      ),
                      ),
                    )
                  ]
              ),
            ),
          ]
      ),
    );
  }
}