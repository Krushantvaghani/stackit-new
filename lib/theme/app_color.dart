import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // Categories color
  final Color occur = Color(0xffb38220);
  final Color red = Color(0xfff8575e);
  final Color purple = Color(0xff9f50bf);
  final Color peach = Color(0xffe09c5f);
  final Color skyBlue = Color(0xff639fdc);
  final Color darkGreen = Color(0xff226e79);
  final Color pink = Color(0xffd17b88);
  final Color brown = Color(0xffbd631a);
  final Color blue = Color(0xff1a71bd);
  final Color green = Color(0xff068425);

  // App Shadow
  final defualtShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 0.7,
    blurRadius: 0.7,
    offset: Offset(0, 0.5),
  );
}
