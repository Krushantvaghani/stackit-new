import 'dart:math';
import 'package:flutter/material.dart';

class Generator {
  static String randomString(int length) {
    var rand = Random();
    var codeUnits = List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });

    return String.fromCharCodes(codeUnits);
  }
}
