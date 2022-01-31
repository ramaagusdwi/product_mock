import 'package:flutter/material.dart';

Color primaryColorDark = hexToColor("#de3121");
Color primaryColor = hexToColor("#E34D40");
Color lightPrimaryColor =  hexToColor("#eb837a");
Color blackFontColorDark = hexToColor("#444444");
Color greyFontColorDark = hexToColor("#666666");
Color iconColor = hexToColor("#E24E42");
Color bgIconColor = Color(0xB3E24E42);



Color hexToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return new Color(int.parse(hexColor, radix: 16) + 0xFF000000);
}