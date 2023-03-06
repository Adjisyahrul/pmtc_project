import 'package:flutter/material.dart';
import 'package:pmtc_project/model/perusahaan.dart';
import 'package:pmtc_project/screens/perusahaan_screen.dart';
import 'package:pmtc_project/utils/font.dart';

class PerusahaanCard extends StatelessWidget {
  final Perusahaan perusahaan;

  const PerusahaanCard({Key? key, required this.perusahaan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? days;
    if (perusahaan.deadline != null) {
      days = (DateTime.now().millisecondsSinceEpoch -
          (perusahaan.deadline?.millisecondsSinceEpoch ?? 0)) /
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
            builder: (context) =>
                PerusahaanScreenController(perusahaanId: perusahaan.id ?? ""),
          ));
        },
        leading: // fixed width and height
            Image.asset("Images/Logo_MTC.png"),
        title: Text(
          perusahaan.nama,
          style: fontLatoHeadline,
        ),
        subtitle: Row(
          children: [
            if (perusahaan.deadline != null)
                Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blueAccent),
                    child: Text(perusahaan.deadline!.toString().split(" ")[0]),
                  ),
            const SizedBox(width: 8),
            if (days != null)
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueAccent),
                child: Text("${days} hari lagi"),
              ),
          ],
        ),
      ),
    );
  }
}
