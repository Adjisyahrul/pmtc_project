import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'saya_screen.dart';
import 'tambah_alat.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItems = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Dashboard(),
    const TambahAlat(),
    const RiwayatPemeriksaan(),
    const Saya()
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
