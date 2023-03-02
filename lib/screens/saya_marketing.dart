// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pmtc_project/model/notif.dart';
// import 'package:pmtc_project/screens/login.dart';
// import 'package:pmtc_project/widget/notifikasi.dart';
//
// import '../utils/font.dart';
// import '../widget/divider.dart';
//
// class Saya extends StatelessWidget {
//   const Saya({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.only(top: 84, bottom: 18),
//       children: [
//         SafeArea(
//             child: Column(
//               children: [
//                 Container(
//                   height: 150,
//                   width: 150,
//                   margin: EdgeInsets.only(bottom: 15),
//                   child: ClipOval(
//                     child: Image.network(
//                       'https://awsimages.detik.net.id/visual/2022/02/03/pengeboran-blok-rokan-dok-pt-pertamina-hulu-rokan.jpeg?w=650',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(bottom: 15),
//                   child: Column(
//                     children: [
//                       Text(
//                         FirebaseAuth.instance.currentUser?.displayName ?? "-",
//                         style: fontLatoJudul,
//                       ),
//                       Text(
//                         FirebaseAuth.instance.currentUser?.email ?? "No user",
//                         style: fontLatoJudul,
//                       ),
//                       TextButton(
//                           onPressed: () {
//                             FirebaseAuth.instance.signOut();
//                             Navigator.of(context).pushReplacement(MaterialPageRoute(
//                                 builder: (context) => LoginPage()));
//                           },
//                           child: Text("Sign out"))
//                     ],
//                   ),
//                 ),
//                 divider,
//                 Container(
//                     padding: EdgeInsets.only(top: 15, left: 24, right: 25),
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(bottom: 15),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Recent Activity",
//                                 style: fontLatoSubJudul,
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     )),
//                 StreamBuilder(
//                     stream: FirebaseFirestore.instance
//                         .collection('notif')
//                         .withConverter<Notif>(
//                       fromFirestore: (snapshot, _) =>
//                           Notif.fromJson(snapshot.data()!),
//                       toFirestore: (alat, _) => alat.toJson(),
//                     )
//                         .snapshots(),
//                     builder: (BuildContext context,
//                         AsyncSnapshot<QuerySnapshot<Notif>> snapshot) {
//                       if (!snapshot.hasData) return Text('Loading...');
//
//                       final docs = snapshot.data!.docs;
//                       docs.sort((a, b) =>
//                           b.data().timestamp.compareTo(a.data().timestamp));
//
//                       return ListView(
//                         scrollDirection: Axis.vertical,
//                         shrinkWrap: true,
//                         children: docs.map((doc) {
//                           final notif = doc.data();
//                           return Notifikasi(notif: notif);
//                         }).toList(),
//                       );
//                     }),
//               ],
//             ))
//       ],
//     );
//   }
// }
