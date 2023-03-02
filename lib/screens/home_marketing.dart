import 'package:flutter/material.dart';

import 'chart_marketing.dart';
import 'dashboard_marketing.dart';
import 'saya_screen.dart';
import 'tabel_marketing.dart';
import 'tambah_marketing.dart';

class HomeMarketing extends StatefulWidget {
  const HomeMarketing({Key? key}) : super(key: key);

  @override
  State<HomeMarketing> createState() => _HomeMarketingState();
}

class _HomeMarketingState extends State<HomeMarketing> {
  int _selectedItems = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const DashboardMarketing(),
    const TambahPerusahaan(),
    const BarChartSample2(),
    const Tabel(),
    const Saya(),
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
              icon: Icon(Icons.account_circle_rounded),
              label: "Chart"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Table"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Profile"),
        ],
        currentIndex: _selectedItems,
        onTap: onItemTapped,
      ),
    );
  }
}
