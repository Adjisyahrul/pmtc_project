import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmtc_project/screens/home_marketing.dart';

import 'home.dart';
import 'login.dart';

class PMTCApp extends StatelessWidget {
  const PMTCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        ),
        home: const AuthController());
  }
}

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (!snapshot.hasData) return const LoginPage();

        if (snapshot.data.email == "marketingadmin@pmtc.id") {
          return const HomeMarketing();
        } else {
          return const Home();
        }
      },
    );
  }
}
