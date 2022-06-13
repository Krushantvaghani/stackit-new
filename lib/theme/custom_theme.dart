import 'package:flutter/material.dart';

class CustomTheme {
  static final Color occur = Color(0xffb38220);
  static final Color peach = Color(0xffe09c5f);
  static final Color skyBlue = Color(0xff639fdc);
  static final Color darkGreen = Color(0xff226e79);
  static final Color red = Color(0xfff8575e);
  static final Color purple = Color(0xff9f50bf);
  static final Color pink = Color(0xffd17b88);
  static final Color brown = Color(0xffbd631a);
  static final Color blue = Color(0xff1a71bd);
  static final Color green = Color(0xff068425);
  static final Color yellow = Color(0xfffff44f);
  static final Color orange = Color(0xffFFA500);

  final Color card,
      cardDark,
      border,
      borderDark,
      disabledColor,
      onDisabled,
      colorInfo,
      colorWarning,
      colorSuccess,
      colorError,
      shadowColor,
      onInfo,
      onWarning,
      onSuccess,
      onError;

  CustomTheme({
    this.border = const Color(0xffeeeeee),
    this.borderDark = const Color(0xffe6e6e6),
    this.card = const Color(0xfff0f0f0),
    this.cardDark = const Color(0xfffefefe),
    this.disabledColor = const Color(0xffdcc7ff),
    this.onDisabled = const Color(0xffffffff),
    this.colorWarning = const Color(0xffffc837),
    this.colorInfo = const Color(0xffff784b),
    this.colorSuccess = const Color(0xff3cd278),
    this.shadowColor = const Color(0xff1f1f1f),
    this.onInfo = const Color(0xffffffff),
    this.onWarning = const Color(0xffffffff),
    this.onSuccess = const Color(0xffffffff),
    this.colorError = const Color(0xfff0323c),
    this.onError = const Color(0xffffffff),
  });

  //************************************************  Custom App Theme ************************************************//

  static final CustomTheme lightCustomTheme = CustomTheme(
    card: Color(0xfff6f6f6),
    cardDark: Color(0xfff0f0f0),
    disabledColor: Color(0xff636363),
    onDisabled: Color(0xffffffff),
    colorInfo: Color(0xffff784b),
    colorWarning: Color(0xffffc837),
    colorSuccess: Color(0xff3cd278),
    shadowColor: Color(0xff3cd278),
    onInfo: Color(0xffffffff),
    onSuccess: Color(0xffffffff),
    onWarning: Color(0xffffffff),
    colorError: Color(0xfff0323c),
    onError: Color(0xffffffff),
  );

  static final CustomTheme darkCustomTheme = CustomTheme(
    card: Color(0xff222327),
    cardDark: Color(0xff101010),
    border: Color(0xff303030),
    borderDark: Color(0xff363636),
    disabledColor: Color(0xffbababa),
    onDisabled: Color(0xff000000),
    colorInfo: Color(0xffff784b),
    colorWarning: Color(0xffffc837),
    colorSuccess: Color(0xff3cd278),
    shadowColor: Color(0xff202020),
    onInfo: Color(0xffffffff),
    onSuccess: Color(0xffffffff),
    onWarning: Color(0xffffffff),
    colorError: Color(0xfff0323c),
    onError: Color(0xffffffff),
  );
}
