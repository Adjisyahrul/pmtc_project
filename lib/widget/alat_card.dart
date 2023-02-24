import 'package:flutter/material.dart';
import 'package:pmtc_project/model/alat.dart';
import 'package:pmtc_project/screens/alat_screen.dart';
import 'package:pmtc_project/utils/font.dart';
import 'package:pmtc_project/utils/colors.dart';

class AlatCard extends StatelessWidget {
  final Alat alat;

  const AlatCard({Key? key, required this.alat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var days = 0;
    if (alat.history != null) {
      days = (DateTime.now().millisecondsSinceEpoch -
              (alat.history?.first.timestamp.millisecondsSinceEpoch ?? 0)) /
          1000 /
          60 /
          60 ~/
          24;
    }

    return Card(
      margin: EdgeInsets.only(top: 10),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AlatScreenController(
                    alatId: alat.id ?? "",
                  )));
        },
        leading: // fixed width and height
            Image.asset("Images/Logo_MTC.png"),
        title: Text(
          alat.nama,
          style: fontLatoHeadline,
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(alat.kategori),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blueAccent),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(hijau)),
                    child: Text(alat.interval),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(alat.pic),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text("${days} hari lalu"),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.redAccent),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
