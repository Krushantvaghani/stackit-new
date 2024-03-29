/*
* File : Travels Profile
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:stackit/assets/index.dart';
import 'package:stackit/global/packages/config_package.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';
import 'package:stackit/widgets/custom_container.dart';

class TravelProfileScreen extends StatefulWidget {
  const TravelProfileScreen({Key? key}) : super(key: key);

  @override
  _TravelProfileScreenState createState() => _TravelProfileScreenState();
}

class _TravelProfileScreenState extends State<TravelProfileScreen>
    with SingleTickerProviderStateMixin {
  late ThemeData theme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = AppTheme.theme;
  }

  // Setting List Row
  Widget singleRow({required String title, IconData? icon}) {
    return Row(
      children: [
        CustomContainer(
          paddingAll: 8,
          borderRadiusAll: 4,
          color: theme.colorScheme.onBackground.withAlpha(20),
          child: Icon(
            icon,
            color: theme.colorScheme.onBackground,
            size: 20,
          ),
        ),
        Spacing.width(16),
        Expanded(
          child: Text(
            title,
            style: AppCss.getTextStyle(theme.textTheme.bodyText2!,
                fontWeight: 600,
                color: theme.colorScheme.onBackground,
                letterSpacing: 0.5,
                textAlign: TextAlign.left),
          ),
        ),
        Spacing.width(16),
        Icon(
          Icons.keyboard_arrow_right,
          color: theme.colorScheme.onBackground.withAlpha(160),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier?>(
      builder: (BuildContext context, AppThemeNotifier? value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: AppTheme.getThemeFromThemeMode(value!.themeMode()),
          home: SafeArea(
            child: Scaffold(
              body: ListView(
                padding: const EdgeInsets.all(20),
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
                        Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Aesha shah",
                                  style: AppCss.getTextStyle(
                                      theme.textTheme.subtitle1!,
                                      fontWeight: 700,
                                      letterSpacing: 0)),
                              Text("aeshashah@shopy.com",
                                  style: AppCss.getTextStyle(
                                      theme.textTheme.caption!,
                                      fontWeight: 600,
                                      letterSpacing: 0.3)),
                            ],
                          ),
                        ),
                        // Expanded(
                        //   child: Align(
                        //     alignment: Alignment.centerRight,
                        //     child: Icon(
                        //       MdiIcons.chevronRight,
                        //       color: themeData!.colorScheme.onBackground,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Spacing.height(24),
                  Text(
                    'General',
                    style: AppCss.getTextStyle(theme.textTheme.subtitle1!,
                        fontWeight: 700),
                  ),
                  Spacing.height(24),
                  singleRow(title: "Notifications", icon: FeatherIcons.bell),
                  Spacing.height(8),
                  Divider(),
                  Spacing.height(8),
                  singleRow(title: "Edit Profile", icon: FeatherIcons.edit),
                  Spacing.height(8),
                  Divider(),
                  Spacing.height(8),
                  singleRow(title: "Language", icon: FeatherIcons.globe),
                  Spacing.height(8),
                  Divider(),
                  Spacing.height(8),
                  singleRow(title: "Profile setting", icon: FeatherIcons.user),
                  Spacing.height(8),
                  Divider(),
                  Spacing.height(8),
                  singleRow(
                      title: "Terms & conditions",
                      icon: FeatherIcons.helpCircle),
                  Spacing.height(8),
                  Divider(),
                  Spacing.height(8),
                  singleRow(title: "Privacy policy", icon: FeatherIcons.shield),
                  Spacing.height(8),
                  Divider(),
                  Spacing.height(8),
                  singleRow(title: "About us", icon: FeatherIcons.info),
                  Spacing.height(8),
                  Divider(),
                  Spacing.height(8),
                  singleRow(title: "Logout", icon: FeatherIcons.logOut),
                  Spacing.height(8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
