/*
* File : Travels Blog
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackit/assets/index.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';

import '../../../assets/index.dart';

class TravelBlogScreen extends StatefulWidget {
  const TravelBlogScreen({Key? key}) : super(key: key);

  @override
  _TravelBlogScreenState createState() => _TravelBlogScreenState();
}

class _TravelBlogScreenState extends State<TravelBlogScreen>
    with SingleTickerProviderStateMixin {
  ThemeData? themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier?>(
      builder: (BuildContext context, AppThemeNotifier? value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: AppTheme.getThemeFromThemeMode(value!.themeMode()),
          home: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                titleSpacing: 0,
                backgroundColor: Colors.transparent,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Social Hub',
                      style: AppCss.getTextStyle(
                          themeData!.textTheme.headline6!,
                          color: AppTheme.theme.primaryColor,
                          fontWeight: 700,
                          letterSpacing: 0.5),
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        imageAssets.profileImage,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
