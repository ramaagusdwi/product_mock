import 'package:flutter/material.dart';

class VColor {
  // static const Color main = Color(0xFFFABA0A);
  static const Color main = Color(0xFF00880D);
  static const Color mainDark = Color(0xFF005908);
  static const Color black = Color(0xFF3B3C42);
  static const Color black2 = Color(0xFF212121);
  static const Color black3 = Color(0xFF3B3C42);
  static const Color black4 = Color(0xFF333333);
  static const Color black5 = Color(0xFF000000);
  static const Color green = Color(0xFF27AE60);
  static const Color today = Color(0xFFFBCE50);
  static const Color emeraldGreen = Color(0xFF00880c);
  static const Color yellowGreen = Color(0xFF37BA38);
  static const Color rose = Color(0xFFED2736);

  static const Color blueh = Color(0xFF3498DB);
  static const Color lightBlue = Color(0xFF1A9DE5);
  static const Color skyBlue = Color(0xFF0081A0);

  static const Color whitey = Color(0xFFF3F6F6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color trafficWhite = Color(0xFFFAFAFA);
  static const Color greyWhite = Color(0xFFE9E9E9);
  static const Color signalWhite = Color(0xFFE9FFEA);

  static const Color darkGreen = Color(0xFF16893F);
  static const Color lightGreen2 = Color(0xFFE2F5EC);
  static const Color lightGreen3 = Color(0xFFD3E9DF);
  static const Color red = Color(0xFFEB5757);
  static const Color orange = Color(0xFFF2994A);
  static const Color textInputGrey = Color(0xFFE3E9F1);
  static const Color grey = Color(0xFFE5E5E5);
  static const Color darkGrey = Color(0xFFE5E5E5);
  static const Color grey2 = Color(0xFFBDBDBD);
  static const Color grey3 = Color(0xFFF2F2F2);
  static const Color grey4 = Color(0xFFF7F7F8);
  static const Color grey5 = Color(0xFF969696);
  static const Color grey6 = Color(0xFFA4A4A4);
  static const Color grey7 = Color(0xFFD3D3D3);
  static const Color grey8 = Color(0xFF999EA6);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color lightGreen = Color.fromRGBO(226, 245, 236, 0.5);
  static const Color lightGreyBorder = Color(0xFFE3E9F1);
  static const Color tarpaulinGrey = Color(0xFF4C4E4D);
  static const Color agateGrey = Color(0xFFBBBBBB);
  static const Color dustyGrey = Color(0xFF7C7D7C);

  static const Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  static List<String> chartColors = [
    "#F2994A",
    "#27AE60",
    "#2F80ED",
    "#9B51E0",
    "#EB5757"
  ];

  static List<String> chartColors2 = ["#3498DB", "#F2994A"];

  static List<String> chartColorsRedish = [
    "#FFAE8F",
    "#CD6684",
    "#6F5A7E",
    "#FF677D",
  ];

  static List<Color> chartColorsForText = [
    Color(0xFFB9EF45),
    Color(0xFFFFEA2C),
    Color(0xFFFF9345),
    Color(0xFFFF7669),
    Color(0xFF2ED47A),
  ];

  static const MaterialColor primary = MaterialColor(0xFF4554A5, color);

  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
