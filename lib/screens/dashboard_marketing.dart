import 'package:flutter/material.dart';
import 'perusahaan_screen.dart';

class DashboardMarketing extends StatelessWidget {
  const DashboardMarketing({Key? key}) : super(key: key);

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
                    hintText: "Cari Perusahaan",
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