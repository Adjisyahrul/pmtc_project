import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmtc_project/screens/Alat.dart';
import 'package:pmtc_project/utils/colors.dart';
import 'package:pmtc_project/utils/font.dart';
import 'package:pmtc_project/widget/card.dart';
import 'package:pmtc_project/widget/container_pembatas.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItems = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    TambahAlat(),
    RiwayatPemeriksaan(),
    Saya()
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedItems = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItems),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // <-- This works for fixed
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Saya"),
        ],
        currentIndex: _selectedItems,

        onTap: onItemTapped,
      ),
    );
  }
}

// Card
//Dashboard
class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
                    hintText: "Cari Alat",
                    border: InputBorder.none),
              ),
            ),
            const Text(
              "Tenggat Waktu Pemeriksaan",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            card(),
            card(),
            card(),
            card(),
            card()
          ],
        ),
      ),
    );
  }
}
//Tambah Alat

const List<String> listJenisAlat = <String>[
  'Air Resuscitator',
  'Life Jacket',
  'Aviation Liferaft',
  'Breathing Air Compressor',
  'Diving Equipment',
  'Fire Fighting',
  'First Aid',
  'Hues',
  'Marine Liferaft',
  'Marine Lifejacket',
  'Swimming Pool',
  'Twin Fall Lifeboat'
];

const List<String> listJenisPemeriksaan = <String>[
  'Daily',
  'Weekly',
  '2 week',
  'Monthly',
  '2 Month',
  '3 month',
  '6 Month',
  '9 Month',
  'Every Year',
  '2 year',
  '3 Year',
  '5 Year'
];

const List<String> listPIC = <String>[
  'Untung M',
  'Rio Dwi',
  'Darma F',
  'Bayu',
  'Adhi F'
];

DateTime? _dateTime;

class TambahAlat extends StatefulWidget {
  const TambahAlat({Key? key}) : super(key: key);

  @override
  State<TambahAlat> createState() => _TambahAlatState();
}

class _TambahAlatState extends State<TambahAlat> {
  String dropdownValueJenisalat = listJenisAlat.first;
  String dropdownValueJenisPemeriksaan = listJenisPemeriksaan.first;
  String dropdownValuePIC = listPIC.first;
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
                            items: listJenisAlat
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
                            items: listJenisPemeriksaan
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
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            value: dropdownValuePIC,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                label: Text(
                              "Pilih PIC",
                              style: fontLatoIsi,
                            )),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValuePIC = value!;
                              });
                            },
                            items: listPIC
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
                    datePicker()
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
                              onPressed: () {},
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

class ActionSection extends StatefulWidget {
  const ActionSection({Key? key}) : super(key: key);

  @override
  State<ActionSection> createState() => _ActionSectionState();
}

class _ActionSectionState extends State<ActionSection> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Action yang perlu ditambahkan", border: InputBorder.none),
    );
  }
}

//DatePicker
class datePicker extends StatefulWidget {
  const datePicker({Key? key}) : super(key: key);

  @override
  State<datePicker> createState() => _datePickerState();
}

class _datePickerState extends State<datePicker> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController,
      decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today),
          labelText: 'Batas Pemeriksaan',
          border: InputBorder.none),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(), //get today's date
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          print(
              pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
          String formattedDate = DateFormat(
            "dd, MMMM yyyy",
          ).format(pickedDate);
          // format date in required form here we use yyyy-MM-dd that means time is removed
          print(
              formattedDate); //formatted date output using intl package =>  2022-07-04
          //You can format date as per your need
          setState(() {
            dateController.text =
                formattedDate; //set foratted date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
    );
  }
}

//Saya
class Saya extends StatelessWidget {
  const Saya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 84, bottom: 18),
      children: [
        SafeArea(
            child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              margin: EdgeInsets.only(bottom: 15),
              child: ClipOval(
                child: Image.network(
                  'https://awsimages.detik.net.id/visual/2022/02/03/pengeboran-blok-rokan-dok-pt-pertamina-hulu-rokan.jpeg?w=650',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FirebaseAuth.instance.currentUser!.email!??"No user",
                    style: fontLatoJudul,
                  )
                ],
              ),
            ),
            container_pembatas,
            Container(
                padding: EdgeInsets.only(top: 15, left: 24, right: 25),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Recent Activity",
                            style: fontLatoSubJudul,
                          )
                        ],
                      ),
                    ),
                    contohUntukBagianSaya(),
                    contohUntukBagianSaya(),
                    contohUntukBagianSaya(),
                    contohUntukBagianSaya()
                  ],
                )),
          ],
        ))
      ],
    );
  }
}

class contohUntukBagianSaya extends StatelessWidget {
  const contohUntukBagianSaya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Alat()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.only(left: 8, top: 10, right: 8, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1)),
            child: Text(
              "Pressure Regulator pada Pemeriksaan Mingguan  telah diupdate dan diperiksa  pada Minggu, 3 Desember 2022 pukul 06.55  ",
              style: fontLatoIsi,
              overflow: TextOverflow.clip,
            ),
          ))
        ],
      ),
    );
    ;
  }
}

//Dashboard
class RiwayatPemeriksaan extends StatelessWidget {
  const RiwayatPemeriksaan({Key? key}) : super(key: key);

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
                    hintText: "Cari Alat",
                    border: InputBorder.none),
              ),
            ),
            const Text(
              "Riwayat Pemeriksaan",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            card(),
            card(),
            card(),
            card(),
            card()
          ],
        ),
      ),
    );
  }
}
