import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:pmtc_project/model/perusahaan.dart';
import 'package:pmtc_project/utils/font.dart';
import 'package:pmtc_project/utils/colors.dart';
import 'package:pmtc_project/widget/divider.dart';

import 'tambah_marketing.dart';

class PerusahaanScreenController extends StatelessWidget {
  final String perusahaanId;

  const PerusahaanScreenController({Key? key, required this.perusahaanId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("perusahaan")
            .doc(perusahaanId)
            .withConverter<Perusahaan>(
              fromFirestore: (snapshot, _) =>
                  Perusahaan.fromJson(snapshot.id, snapshot.data()!),
              toFirestore: (perusahaan, _) => perusahaan.toJson(),
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading...");
          }

          final perusahaan = snapshot.data!.data()!;
          return PerusahaanScreen(perusahaan: perusahaan);
        });
  }
}

class PerusahaanScreen extends StatefulWidget {
  final Perusahaan? perusahaan;

  const PerusahaanScreen({Key? key, this.perusahaan}) : super(key: key);

  @override
  State<PerusahaanScreen> createState() => _PerusahaanScreenState();
}

class _PerusahaanScreenState extends State<PerusahaanScreen> {
  final _deadlineController = TextEditingController();
  late DateTime? _deadline;

  late String _onProcess = SPKOnProcessStatus.first;
  late String _sudahKirim = SPKDeliveredStatus.first;
  late String _sudahKembali = SPKReturnedStatus.first;

  late DocumentReference perusahaanRef;
  final CollectionReference notifRef =
      FirebaseFirestore.instance.collection("notif-perusahaan");

  @override
  void initState() {
    super.initState();
    perusahaanRef = FirebaseFirestore.instance
        .collection('perusahaan')
        .doc(widget.perusahaan?.id ?? "");

    _deadline = widget.perusahaan?.deadline;
    _deadlineController.text = widget.perusahaan?.deadline != null
        ? DateFormat("dd, MMMM yyyy").format(widget.perusahaan!.deadline!)
        : "Belum memilih deadline";

    _onProcess = widget.perusahaan?.onProcess ?? SPKOnProcessStatus.first;
    _sudahKirim = widget.perusahaan?.delivered ?? SPKDeliveredStatus.first;
    _sudahKembali = widget.perusahaan?.returned ?? SPKReturnedStatus.first;
  }

  void checkAction(int index) {
    setState(() {
      // actions[index] = true;
    });
  }

  void uncheckAction(int index) {
    setState(() {
      // actions[index] = false;
    });
  }

  void submit() async {
    final messenger = ScaffoldMessenger.of(context);
    if (widget.perusahaan == null) return;

    if (_onProcess == "Belum") {
      messenger.showSnackBar(const SnackBar(
          content: Text("Mohon ubah SPK On Procces terlebih dahulu!")));
      return;
    }

    if (_deadline == widget.perusahaan!.deadline &&
        _onProcess == widget.perusahaan!.onProcess &&
        _sudahKirim == widget.perusahaan!.delivered &&
        _sudahKembali == widget.perusahaan!.returned) {
      messenger
          .showSnackBar(const SnackBar(content: Text("Tidak ada perubahan!")));
      return;
    }

    await notifRef.add({
      'timestamp': Timestamp.now(),
      'deadline': _deadline != widget.perusahaan!.deadline ? _deadline : null,
      'onProcess':
          _onProcess != widget.perusahaan!.onProcess ? _onProcess : null,
      'delivered':
          _sudahKirim != widget.perusahaan!.delivered ? _sudahKirim : null,
      'returned':
          _sudahKembali != widget.perusahaan!.returned ? _sudahKembali : null,
      'id': widget.perusahaan!.id,
    });

    await perusahaanRef.update({
      'onProcess': _onProcess,
      'delivered': _sudahKirim,
      'returned': _sudahKembali,
      'deadline': _deadline != null ? Timestamp.fromDate(_deadline!) : null,
    });

    messenger.showSnackBar(const SnackBar(content: Text("Berhasil!")));
  }

  @override
  void dispose() {
    _deadlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Perusahaan",
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
                  widget.perusahaan?.nama ?? "",
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
              divider,
              Text(widget.perusahaan!.alamat),
              Text(widget.perusahaan!.pic),
              Text(widget.perusahaan!.deskripsi),
              divider,
              const Text("Ubah deadline"),
              TextField(
                controller: _deadlineController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Deadline Kerjasama',
                    border: InputBorder.none),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat("dd, MMMM yyyy").format(pickedDate);
                    setState(() {
                      _deadlineController.text = formattedDate;
                      _deadline = pickedDate;
                    });
                  }
                },
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
                              items: SPKOnProcessStatus.map<
                                  DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
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
                              items: SPKDeliveredStatus.map<
                                  DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
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
                          ),
                        ),
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
              ),
              divider,
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("notif-perusahaan")
                      .where("id", isEqualTo: widget.perusahaan?.id ?? "")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading...");
                    }

                    // return Text(snapshot.data!.size.toString());
                    return ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: snapshot.data?.docs.map((doc) {
                              return Column(
                                children: [
                                  Text((doc.get("timestamp") as Timestamp)
                                      .toDate()
                                      .toString()),
                                  if (doc.get("onProcess") != false)
                                    Text("OnProcess = ${doc.get("onProcess")}"),
                                ],
                              );
                              return Text("a");
                            }).toList() ??
                            []);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
