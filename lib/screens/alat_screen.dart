import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pmtc_project/model/alat.dart';
import 'package:pmtc_project/utils/font.dart';
import 'package:pmtc_project/utils/colors.dart';
import 'package:pmtc_project/widget/divider.dart';

class AlatScreenController extends StatelessWidget {
  final String alatId;

  const AlatScreenController({Key? key, required this.alatId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("alat")
            .doc(alatId)
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
          return AlatScreen(alat: alat);
        });
  }
}

class AlatScreen extends StatefulWidget {
  final Alat? alat;

  const AlatScreen({Key? key, this.alat}) : super(key: key);

  @override
  State<AlatScreen> createState() => _AlatScreenState();
}

class _AlatScreenState extends State<AlatScreen> {
  late List<bool> actions;
  final deskripsiController = TextEditingController();
  final pemeriksaController = TextEditingController();

  late DocumentReference alatRef;
  final CollectionReference notifRef =
  FirebaseFirestore.instance.collection("notif");

  @override
  void initState() {
    super.initState();
    actions = (widget.alat?.action.map((e) => false).toList() ?? []);
    alatRef = FirebaseFirestore.instance
        .collection('alat')
        .doc(widget.alat?.id ?? "");
  }

  void checkAction(int index) {
    setState(() {
      actions[index] = true;
    });
  }

  void uncheckAction(int index) {
    setState(() {
      actions[index] = false;
    });
  }

  void submit() async {
    if (widget.alat == null) return;

    await alatRef.update({
      'history': FieldValue.arrayUnion([
        {
          'action': actions,
          'timestamp': Timestamp.now(),
          'pemeriksa': pemeriksaController.text,
          'deskripsi': deskripsiController.text,
        }
      ]),
    });

    await notifRef.add({
      'timestamp': Timestamp.now(),
      'id': widget.alat!.id,
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Berhasil!")));

    setState(() {
      actions = (widget.alat?.action.map((e) => false).toList() ?? []);
      deskripsiController.text = "";
      pemeriksaController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.alat?.history?.sort((a, b) {
      return b.timestamp.compareTo(a.timestamp);
    });

    var days = 0;
    if (widget.alat?.history != null) {
      days = (DateTime
          .now()
          .millisecondsSinceEpoch -
          (widget.alat?.history?.first.timestamp.millisecondsSinceEpoch ??
              0)) /
          1000 /
          60 /
          60 ~/
          24;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Alat Pemeriksaan",
          style: fontLatoJudul,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(Icons.edit),
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 30),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.alat?.nama ?? "",
                  style: fontLatoJudul,
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 16, bottom: 8),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.asset(
                    "Images/Logo_MTC.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        widget.alat?.kategori ?? "",
                        style: fontLatoIsi,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(biru)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        widget.alat?.interval ?? "",
                        style: fontLatoIsi,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(hijau)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        widget.alat?.pic ?? "",
                        style: fontLatoIsi,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 0.5)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text("Terakhir diperiksa ${days} hari yang lalu",
                          style: fontLatoIsi),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 0.5)),
                    ),
                  ],
                ),
              ),
              divider,
              Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Action",
                          style: fontLatoSubJudul,
                        ),
                        Column(
                          children: [
                            Text("Status", style: fontLatoSubJudul),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.check_box),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.close),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: (widget.alat?.action ?? [])
                            .asMap()
                            .entries
                            .map((e) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(
                                    e.value,
                                    style: fontLatoIsi,
                                    overflow: TextOverflow.clip,
                                  )),
                              SizedBox(width: 16),
                              Row(
                                children: [
                                  Radio(
                                      value: true,
                                      groupValue: actions[e.key],
                                      onChanged: (value) {
                                        if (value == true) {
                                          checkAction(e.key);
                                        } else {
                                          uncheckAction(e.key);
                                        }
                                      }),
                                  Radio(
                                      value: false,
                                      groupValue: actions[e.key],
                                      onChanged: (value) {
                                        if (value == false) {
                                          uncheckAction(e.key);
                                        } else {
                                          checkAction(e.key);
                                        }
                                      }),
                                ],
                              ),
                            ],
                          );
                        }).toList()),
                  ],
                ),
              ),
              Container(
                padding:
                EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
                child: Column(
                  children: [
                    Row(children: [
                      Text(
                        "Deskripsi Tambahan",
                        style: fontLatoSubJudul,
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 16),
                      child: TextField(
                        controller: deskripsiController,
                        decoration: InputDecoration(
                            hintText: "Silakan isi deskripsi",
                            border: OutlineInputBorder(),
                            hintMaxLines: 360),
                      ),
                    ),
                    Row(children: [
                      Text(
                        "Pemeriksa",
                        style: fontLatoSubJudul,
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 17),
                      child: TextField(
                        controller: pemeriksaController,
                        decoration: InputDecoration(
                            hintText: "Silakan isi nama pemeriksa",
                            border: OutlineInputBorder(),
                            hintMaxLines: 360),
                      ),
                    ),
                    MaterialButton(
                      minWidth: double.maxFinite, // set minWidth to maxFinite
                      color: Colors.blue,
                      onPressed: submit,
                      child: Text(
                        "Simpan",
                        style: fontLatoIsi,
                      ),
                    ),
                  ],
                ),
              ),
              divider,
              Row(children: [
                Text(
                  "History",
                  style: fontLatoSubJudul,
                ),
              ]),
              ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children:
                  (widget.alat?.history ?? [])
                      .asMap()
                      .entries
                      .map((e) {
                    return Column(children: [
                      Text("#${(widget.alat?.history?.length ?? 0) - e.key}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.value.pemeriksa,
                            style: fontLatoIsi,
                            overflow: TextOverflow.clip,
                          ),
                          SizedBox(width: 16),
                          Text(
                            DateFormat("dd/MM/yyyy hh:mm:ss")
                                .format(e.value.timestamp),
                            style: fontLatoIsi,
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                      ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: (widget.alat?.action ?? [])
                              .asMap()
                              .entries
                              .map((ee) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                      ee.value,
                                      style: fontLatoIsi,
                                      overflow: TextOverflow.clip,
                                    )),
                                SizedBox(width: 16),
                                e.value.action[ee.key]
                                    ? Icon(Icons.check_box)
                                    : Icon(Icons.close),
                              ],
                            );
                          }).toList()),
                    ]);
                  }).toList()),
            ],
          ),
        ],
      ),
    );
  }
}
