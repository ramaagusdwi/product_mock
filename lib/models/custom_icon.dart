import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testfokatech/presentation/themes/v_color.dart';

class CustomIcon {
  Color bgColor;

  IconData iconData;
  String title;

  CustomIcon(
      {required this.iconData,
      required this.title,
      this.bgColor = VColor.rose});
}
