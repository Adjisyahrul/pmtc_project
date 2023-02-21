import 'package:flutter/material.dart';
import 'package:pmtc_project/locator/locator.dart';
import 'package:pmtc_project/screens/app.dart';
// import 'package:pmtc_project/screens/main.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pmtc_project/firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(PMTCApp());
}
