import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/model/perusahaan.dart';

import '/widget/divider.dart';
import '/utils/font.dart';
import '/utils/colors.dart';

const List<String> SPKDeliveredStatus = <String>[
  "Belum",
  "Revisi",
  "Sudah",
];

const List<String> SPKReturnedStatus = <String>[
  "Belum",
  "Revisi",
  "Sudah",
];

const List<String> SPKOnProcessStatus = <String>[
  "Belum",
  "Sudah",
];

class TambahPerusahaan extends StatefulWidget {
  const TambahPerusahaan({Key? key}) : super(key: key);

  @override
  State<TambahPerusahaan> createState() => _TambahPerusahaanState();
}

class _TambahPerusahaanState extends State<TambahPerusahaan> {
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _picController = TextEditingController();
  final _deskripsiController = TextEditingController();

  String _onProcess = SPKOnProcessStatus.first;
  String _sudahKirim = SPKDeliveredStatus.first;
  String _sudahKembali = SPKReturnedStatus.first;

  final _keteranganController = TextEditingController();

  final perusahaanRef = FirebaseFirestore.instance
      .collection('perusahaan')
      .withConverter<Perusahaan>(
        fromFirestore: (snapshot, _) =>
            Perusahaan.fromJson(snapshot.id, snapshot.data()!),
        toFirestore: (perusahaan, _) => perusahaan.toJson(),
      );

  Future submit() async {
    final messenger = ScaffoldMessenger.of(context);
    if (_namaController.text.isEmpty ||
        _alamatController.text.isEmpty ||
        _picController.text.isEmpty) {
      messenger.showSnackBar(const SnackBar(content: Text("Tolong lengkapi data!")));
      return;
    }

    await perusahaanRef.add(
      Perusahaan(
          nama: _namaController.text,
          alamat: _alamatController.text,
          pic: _picController.text,
          deskripsi: _deskripsiController.text,
          onProcess: _onProcess,
          delivered: _sudahKirim,
          returned: _sudahKembali,
          keterangan: _keteranganController.text),
    );

    messenger.showSnackBar(const SnackBar(content: Text("Berhasil!")));

    setState(() {
      _namaController.text = "";
      _alamatController.text = "";
      _picController.text = "";
      _deskripsiController.text = "";

      _onProcess = SPKOnProcessStatus.first;
      _sudahKirim = SPKDeliveredStatus.first;
      _sudahKembali = SPKReturnedStatus.first;
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _alamatController.dispose();
    _picController.dispose();
    _deskripsiController.dispose();
    _keteranganController.dispose();

    super.dispose();
  }

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
          padding: const EdgeInsets.only(top: 8, bottom: 30),
          children: [
            SafeArea(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 24,
                    right: 25,
                    bottom: 16,
                  ),
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
                              controller: _namaController,
                              style: fontLatoSubJudul,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                      width: 2.0,
                                    ),
                                  ),
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
                              controller: _alamatController,
                              style: fontLatoSubJudul,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                    width: 2.0,
                                  ),
                                ),
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
                              controller: _picController,
                              style: fontLatoSubJudul,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                    width: 2.0,
                                  ),
                                ),
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
                              controller: _deskripsiController,
                              style: fontLatoSubJudul,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                    width: 2.0,
                                  ),
                                ),
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
                              value: _onProcess,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                      width: 2.0,
                                    ),
                                  ),
                                  label: Text(
                                "Pilih Hasil",
                                style: fontLatoIsi,
                              )),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  _onProcess = value!;
                                });
                              },
                              items: SPKOnProcessStatus.map<DropdownMenuItem<String>>(
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
                              value: _sudahKirim,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                      width: 2.0,
                                    ),
                                  ),
                                  label: Text(
                                "Pilih Hasil",
                                style: fontLatoIsi,
                              )),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  _sudahKirim = value!;
                                });
                              },
                              items:
                                  SPKDeliveredStatus.map<DropdownMenuItem<String>>(
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
                              value: _sudahKembali,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                      width: 2.0,
                                    ),
                                  ),
                                  label: Text(
                                "Pilih Hasil",
                                style: fontLatoIsi,
                              )),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  _sudahKembali = value!;
                                });
                              },
                              items: SPKReturnedStatus.map<
                                  DropdownMenuItem<String>>((String value) {
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
                              controller: _keteranganController,
                              style: fontLatoSubJudul,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                    width: 2.0,
                                  ),
                                ),
                                hintText: "Keterangan",
                              ),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: submit,
                      child: Text("Simpan"),
                    ),
                  ),
                )
              ]),
            ),
          ]),
    );
  }
}
