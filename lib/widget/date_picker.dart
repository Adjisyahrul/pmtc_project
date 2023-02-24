import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController,
      decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today),
          labelText: 'Batas Pemeriksaan',
          border: InputBorder.none),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(), //get today's date
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          if (kDebugMode) {
            print(pickedDate);
          } //get the picked date in the format => 2022-07-04 00:00:00.000
          String formattedDate = DateFormat(
            "dd, MMMM yyyy",
          ).format(pickedDate);
          // format date in required form here we use yyyy-MM-dd that means time is removed
          if (kDebugMode) {
            print(formattedDate);
          } //formatted date output using intl package =>  2022-07-04
          //You can format date as per your need
          setState(() {
            dateController.text =
                formattedDate; //set foratted date to TextField value.
          });
        } else {
          if (kDebugMode) {
            print("Date is not selected");
          }
        }
      },
    );
  }
}
