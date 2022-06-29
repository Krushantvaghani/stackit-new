/*
* File : App Theme
* Version : 1.0.0
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackit/theme/theme_type.dart';

import 'app_theme_notifier.dart';

class AppTheme {
  static int themeLight = 1;
  static int themeDark = 2;

  static ThemeData theme = getThemeFromThemeMode(AppThemeNotifier.theme);

  AppTheme._();

  static TextStyle getTextStyle(TextStyle textStyle,
      {int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double letterSpacing = 0.15,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    double? finalFontSize = fontSize != null ? fontSize : textStyle.fontSize;

    Color finalColor;
    if (color == null) {
      finalColor = (xMuted
          ? textStyle.color!.withAlpha(160)
          : (muted ? textStyle.color!.withAlpha(200) : textStyle.color))!;
    } else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }

    return GoogleFonts.openSans(
        fontSize: finalFontSize,
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  static ThemeData getTheme(int themeMode) {
    if (themeMode == themeLight) {
      return lightTheme;
    } else {
      return darkTheme;
    }
  }

  //App Bar Text
  static final TextTheme lightAppBarTextTheme = TextTheme(
    headline1: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff495057))),
    headline2: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff495057))),
    headline3: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff495057))),
    headline4: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff495057))),
    headline5: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff495057))),
    headline6: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff495057))),
    subtitle1: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff495057))),
    subtitle2: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff495057))),
    bodyText1: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff495057))),
    bodyText2: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff495057))),
    button: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff495057))),
    caption: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xff495057))),
    overline: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xff495057))),
  );
  //Text Themes
  static final TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff4a4c4f))),
    headline2: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff4a4c4f))),
    headline3: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff4a4c4f))),
    headline4: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff4a4c4f))),
    headline5: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff4a4c4f))),
    headline6: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff4a4c4f))),
    subtitle1: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff4a4c4f))),
    subtitle2: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
    bodyText1: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff4a4c4f))),
    bodyText2: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff4a4c4f))),
    button: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
    caption: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xff4a4c4f))),
    overline: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xff4a4c4f))),
  );

  static ThemeData getThemeFromThemeMode(int themeMode) {
    if (themeMode == themeLight) {
      return lightTheme;
    } else if (themeMode == themeDark) {
      return darkTheme;
    }
    return lightTheme;
  }

  //Color Themes
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff1c8c8c),
    canvasColor: Colors.transparent,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xffffffff),
    appBarTheme: AppBarTheme(
      actionsIconTheme: const IconThemeData(
        color: Color(0xff495057),
      ),
      color: const Color(0xffffffff),
      iconTheme: const IconThemeData(color: Color(0xff495057), size: 24),
      toolbarTextStyle: lightAppBarTextTheme.bodyText2,
      titleTextStyle: lightAppBarTextTheme.headline6,
    ),
    navigationRailTheme: const NavigationRailThemeData(
        selectedIconTheme:
            IconThemeData(color: Color(0xff3d63ff), opacity: 1, size: 24),
        unselectedIconTheme:
            IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
        backgroundColor: Color(0xffffffff),
        elevation: 3,
        selectedLabelTextStyle: TextStyle(color: Color(0xff3d63ff)),
        unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
    colorScheme: const ColorScheme.light(
        primary: Color(0xff1c8c8c),
        onPrimary: Colors.white,
        primaryVariant: Color(0xff0055ff),
        secondary: Color(0xff495057),
        secondaryVariant: Color(0xff3cd278),
        onSecondary: Colors.white,
        surface: Color(0xffe2e7f1),
        background: Color(0xfff3f4f7),
        onBackground: Color(0xff495057)),
    cardTheme: CardTheme(
      color: Color(0xfff0f0f0),
      shadowColor: Colors.black.withOpacity(0.4),
      elevation: 1,
      margin: const EdgeInsets.all(0),
    ),
    cardColor: Color(0xfff0f0f0),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 15, color: Color(0xaa495057)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Color(0xff3d63ff)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.black54),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black54)),
    ),
    splashColor: Colors.white.withAlpha(100),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: lightTextTheme,
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffdcc7ff),
    highlightColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xff3d63ff),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: const Color(0xff3d63ff),
        hoverColor: const Color(0xff3d63ff),
        foregroundColor: Colors.white),
    dividerColor: const Color(0xffd1d1d1),
    errorColor: const Color(0xfff0323c),
    accentColor: const Color(0xff3d63ff),
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xffffffff),
      textStyle: lightTextTheme.bodyText2!
          .merge(const TextStyle(color: Color(0xff495057))),
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff3d63ff),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xff3d63ff),
      inactiveTrackColor: const Color(0xff3d63ff).withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xff3d63ff),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      canvasColor: Colors.transparent,
      primaryColor: const Color(0xff3d63ff),
      scaffoldBackgroundColor: const Color(0xff1b1b1b),
      backgroundColor: const Color(0xff1b1b1b),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1b1b1b)),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff3d63ff),
        primaryVariant: Color(0xff3d63ff),
        secondary: Color(0xff00cc77),
        secondaryVariant: Color(0xff00cc77),
        background: Color(0xff1b1b1b),
        onPrimary: Colors.white,
        onBackground: Color(0xfff3f3f3),
        onSecondary: Colors.white,
        surface: Color(0xff585e63),
      ),
      indicatorColor: Colors.white,
      disabledColor: const Color(0xffa3a3a3),
      highlightColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Color(0xff3d63ff)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.white70),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.white70)),
      ),
      dividerColor: const Color(0xff363636),
      errorColor: Colors.orange,
      splashColor: Colors.white.withAlpha(100),
      cardTheme: CardTheme(
        color: Color(0xff222327),
        shadowColor: Colors.black.withOpacity(0.4),
        elevation: 1,
        margin: const EdgeInsets.all(0),
      ),
      cardColor: Color(0xff222327),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xff3d63ff),
          splashColor: Colors.white.withAlpha(100),
          highlightElevation: 8,
          elevation: 4,
          focusColor: const Color(0xff3d63ff),
          hoverColor: const Color(0xff3d63ff),
          foregroundColor: Colors.white),
      bottomAppBarTheme:
          const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Color(0xff495057),
        labelColor: Color(0xff3d63ff),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: const Color(0xff3d63ff),
        inactiveTrackColor: const Color(0xff3d63ff).withAlpha(100),
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: const Color(0xff3d63ff),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        inactiveTickMarkColor: Colors.red[100],
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      cupertinoOverrideTheme: const CupertinoThemeData());
}
