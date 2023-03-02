import 'package:flutter/material.dart';
import '/utils/font.dart';


class Tabel extends StatefulWidget {
  const Tabel({Key? key}) : super(key: key);
  @override
  _DataTable createState() => _DataTable();
}

class _DataTable extends State<Tabel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Data Table'),
          ),
          body:
          SafeArea(child:
          ListView(
              padding: EdgeInsets.only(top: 25,right: 5,left: 5),
              children: <Widget>[
                Center(
                    child: Text(
                      'Frekuensi Kerja Sama',
                      style: fontLatoHeadline,
                    )),
                DataTable(
                  columns: [
                    DataColumn(label: Text(
                        'Nomor',
                        style: fontLatoIsi
                    )),
                    DataColumn(label: Text(
                        'Frekuensi',
                        style: fontLatoIsi
                    )),
                    DataColumn(label: Text(
                        'Perusahaan',
                        style: fontLatoIsi
                    )),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('0')),
                      DataCell(Text('MTXC')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('0')),
                      DataCell(Text('MTC')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('3')),
                      DataCell(Text('0')),
                      DataCell(Text('GG')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('4')),
                      DataCell(Text('0')),
                      DataCell(Text('Kevin Arya')),
                    ]),
                  ],
                ),
              ])
            ,)


      ),
    );
  }
}