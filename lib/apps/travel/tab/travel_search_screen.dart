/*
* File : Travels Search
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stackit/global/assets/index.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';

class TravelSearchScreen extends StatefulWidget {
  const TravelSearchScreen({Key? key}) : super(key: key);

  @override
  _TravelSearchScreenState createState() => _TravelSearchScreenState();
}

class _TravelSearchScreenState extends State<TravelSearchScreen>
    with SingleTickerProviderStateMixin {
  late ThemeData theme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier?>(
      builder: (BuildContext context, AppThemeNotifier? value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
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
                      'Welcome homes',
                      style: AppCss.getTextStyle(
                        theme.textTheme.headline6!,
                        color: theme.colorScheme.primary,
                        fontWeight: 700,
                        letterSpacing: 0.5,
                      ),
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
              body: ListView(
                padding: const EdgeInsets.all(40),
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(imageAssets.avatar4),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: theme.cardTheme.color,
                              border: Border.all(
                                  width: 0.5, color: theme.colorScheme.surface),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.primaryColor.withAlpha(18),
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  MdiIcons.mapMarkerOutline,
                                  color: theme.colorScheme.onBackground,
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      "Address",
                                      style: AppCss.getTextStyle(
                                          theme.textTheme.bodyText2!,
                                          fontWeight: 600),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(left: 4, right: 4),
                            decoration: BoxDecoration(
                              color: theme.cardTheme.color,
                              border: Border.all(
                                  width: 0.5, color: theme.colorScheme.surface),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.primaryColor.withAlpha(18),
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  MdiIcons.creditCardOutline,
                                  color: theme.colorScheme.onBackground,
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      "Payment",
                                      style: AppCss.getTextStyle(
                                          theme.textTheme.bodyText2!,
                                          fontWeight: 700),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(left: 12),
                            decoration: BoxDecoration(
                              color: theme.cardTheme.color,
                              border: Border.all(
                                  width: 0.5, color: theme.colorScheme.surface),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.primaryColor.withAlpha(18),
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  MdiIcons.contentPaste,
                                  color: theme.colorScheme.onBackground,
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      "History",
                                      style: AppCss.getTextStyle(
                                          theme.textTheme.bodyText2!,
                                          fontWeight: 600),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
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
