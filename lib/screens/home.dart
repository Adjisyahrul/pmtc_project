import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pmtc_project/screens/alat_screen.dart';
import 'package:pmtc_project/utils/font.dart';
import 'package:pmtc_project/widget/divider.dart';

import 'dashboard.dart';
import 'tambah_alat.dart';

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
                    FirebaseAuth.instance.currentUser?.email ?? "No user",
                    style: fontLatoJudul,
                  )
                ],
              ),
            ),
            divider,
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
            .push(MaterialPageRoute(builder: (context) => const AlatScreen()));
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
          ],
        ),
      ),
    );
  }
}
