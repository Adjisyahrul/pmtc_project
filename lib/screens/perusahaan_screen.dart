import 'package:flutter/material.dart';
import '/utils/font.dart';


class card extends StatelessWidget {
  const card({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: ListTile(
          onTap: () {
          },
          title: Text(
            "PT Mencari Cinta, Tbk",
            style: fontLatoHeadline,
          ),

          leading: Icon(Icons.account_balance_outlined),
          subtitle:
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text("20/11/2022", style: TextStyle(color: Colors.white)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.redAccent),
              ),
            ],
          )

      ),
    );
  }
}