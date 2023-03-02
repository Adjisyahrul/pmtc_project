import 'package:flutter/material.dart';

var biru = 0xFF66A7D4;
var  hijau = 0xFFD6E295;
var merah = 0xFFF68D97;
var abu_abu_textField = 0xFFF5F5F5;
var biruBorder = 0XFF6CB8;

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }
}