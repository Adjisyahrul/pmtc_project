import 'package:pmtc_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:pmtc_project/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
class PMTCApp extends StatefulWidget {
  const PMTCApp({Key? key}) : super(key: key);

  @override
  State<PMTCApp> createState() => _PMTCAppState();
}

class _PMTCAppState extends State<PMTCApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme
        ),

      ),
      routes: {
      '/': (BuildContext context) => LoginPage(),
    });
  }
}
