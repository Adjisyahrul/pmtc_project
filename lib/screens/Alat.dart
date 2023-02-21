                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  import 'package:flutter/material.dart';
import 'package:pmtc_project/utils/font.dart';
import 'package:pmtc_project/utils/colors.dart';
import 'package:pmtc_project/widget/container_pembatas.dart';


class Alat extends StatefulWidget {
  const Alat({Key? key}) : super(key: key);

  @override
  State<Alat> createState() => _AlatState();
}

class _AlatState extends State<Alat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Alat Pemeriksaan",
          style: fontLatoJudul,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(Icons.edit),
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 30),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Pressure Regulator",
                  style: fontLatoJudul,
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 16, bottom: 8),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.asset(
                    "Images/Logo_MTC.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Air Resuscitator",
                        style: fontLatoIsi,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(biru)),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Mingguan",
                        style: fontLatoIsi,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(hijau)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Milano",
                        style: fontLatoIsi,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 0.5)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text("Dinda", style: fontLatoIsi),
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 0.5)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text("Hinggit", style: fontLatoIsi),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 0.5)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text("20 hari lagi", style: fontLatoIsi),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(hijau)),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text("27/02/2022", style: fontLatoIsi),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(merah)),
                    ),
                  ],
                ),
              ),
              //Container Pembatas
              container_pembatas,
              //Container action
              Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.only(
                  left: 23,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Action",
                          style: fontLatoSubJudul,
                        ),
                        SizedBox(
                          width: 210,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 29),
                              child: Column(
                                children: [
                                  Text("Status", style: fontLatoSubJudul),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.check_box),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(Icons.close)
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 17),
                              child: Text(
                                "apply leak detector solution to the gauge, gasket, and constant flow outlet and all fittings",
                                style: fontLatoIsi,
                                overflow: TextOverflow.clip,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Row(
                              children: [
                                Radio(
                                    value: "radio value",
                                    groupValue: "group value",
                                    onChanged: (value) {
                                      print(value); //selected value
                                    }),
                                Radio(
                                    value: "radio value",
                                    groupValue: "group value",
                                    onChanged: (value) {
                                      print(value); //selected value
                                    }),
                              ],
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 17),
                              child: Text(
                                "Check placement of threaded stem",
                                style: fontLatoIsi,
                                overflow: TextOverflow.clip,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Row(
                              children: [
                                Radio(
                                    value: "radio value",
                                    groupValue: "group value",
                                    onChanged: (value) {
                                      print(value); //selected value
                                    }),
                                Radio(
                                    value: "radio value",
                                    groupValue: "group value",
                                    onChanged: (value) {
                                      print(value); //selected value
                                    }),
                              ],
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 17),
                              child: Text(
                                "apply leak detector solution to the gauge, gasket, and constant flow outlet and all fittings",
                                style: fontLatoIsi,
                                overflow: TextOverflow.clip,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Row(
                              children: [
                                Radio(
                                    value: "radio value",
                                    groupValue: "group value",
                                    onChanged: (value) {
                                      print(value); //selected value
                                    }),
                                Radio(
                                    value: "radio value",
                                    groupValue: "group value",
                                    onChanged: (value) {
                                      print(value); //selected value
                                    }),
                              ],
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 17),
                              child: Text(
                                "Check yoke gasket for crack or breakages",
                                style: fontLatoIsi,
                                overflow: TextOverflow.clip,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Row(
                              children: [
                                Radio(
                                    value: "radio value",
                                    groupValue: "group value",
                                    onChanged: (value) {
                                      print(value); //selected value
                                    }),
                                Radio(
                                    value: "radio value",
                                    groupValue: "group value",
                                    onChanged: (value) {
                                      print(value); //selected value
                                    }),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ),
//Container Pembatas
              container_pembatas,
              Container(
                padding:
                EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
                child: Column(
                  children: [
                    Text(
                      "Deskripsi Tambahan",
                      style: fontLatoSubJudul,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 17),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "silahkan isi deskripsi di sini",
                            border: OutlineInputBorder(),
                            hintMaxLines: 360),
                      ),
                    ),
                    MaterialButton(
                      minWidth: double.maxFinite, // set minWidth to maxFinite
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text(
                        "Simpan",
                        style:
                        fontLatoIsi,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}