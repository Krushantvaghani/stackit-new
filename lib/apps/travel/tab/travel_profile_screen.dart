/*
* File : Travels Profile
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
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
          paddingAll: 10,
          borderRadiusAll: 10,
          color: theme.colorScheme.primary.withAlpha(20),
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
          home: SafeArea(
            child: Scaffold(
              body: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  Text(
                    'Settings',
                    style: AppCss.getTextStyle(theme.textTheme.headline6!,
                        fontWeight: 700, fontSize: 23),
                  ),
                  Spacing.height(10),
                  Text(
                    'View and edit your settings',
                    style: AppCss.getTextStyle(theme.textTheme.bodyText2!,
                        fontWeight: 600,
                        color: AppTheme.theme.colorScheme.onBackground
                            .withAlpha(90)),
                  ),
                  Spacing.height(30),
                  singleRow(title: "Notifications", icon: FeatherIcons.bell),
                  Spacing.height(10),
                  Divider(),
                  Spacing.height(10),
                  singleRow(title: "Language", icon: FeatherIcons.globe),
                  Spacing.height(10),
                  Divider(),
                  Spacing.height(10),
                  singleRow(title: "Profile setting", icon: FeatherIcons.user),
                  Spacing.height(10),
                  Divider(),
                  Spacing.height(10),
                  singleRow(title: "Privacy policy", icon: FeatherIcons.shield),
                  Spacing.height(10),
                  Divider(),
                  Spacing.height(10),
                  singleRow(title: "About us", icon: FeatherIcons.info),
                  Spacing.height(10),
                  Divider(),
                  Spacing.height(10),
                  singleRow(title: "Logout", icon: FeatherIcons.logOut),
                  Spacing.height(10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
