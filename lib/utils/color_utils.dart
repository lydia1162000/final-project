import 'package:flutter/material.dart';

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

const int backgroundColor = 0xffF8F8F8;
BoxShadow shadow = BoxShadow(
    color: Colors.black.withAlpha(8),
    offset: const Offset(0, 10),
    blurRadius: 15);
