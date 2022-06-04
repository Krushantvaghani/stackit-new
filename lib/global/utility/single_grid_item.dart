/*
* File : Single Grid Item
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';

class SinglePageItem extends StatelessWidget {
  final String? title;
  final String? icon;
  final Widget? navigation;
  final IconData? iconData;

  const SinglePageItem({
    Key? key,
    @required this.title,
    @required this.navigation,
    this.icon,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData? themeData = Theme.of(context);

    Widget iconWidget;
    if (icon == null) {
      if (iconData != null) {
        iconWidget = Icon(
          iconData,
          color: AppTheme.theme.primaryColor,
          size: 30,
        );
      } else {
        iconWidget = Image(
          image: AssetImage('assets/icons/rocket-outline.png'),
          color: AppTheme.theme.primaryColor,
          width: 30,
          height: 30,
        );
      }
    } else {
      iconWidget = Image(
        image: AssetImage(icon!),
        color: AppTheme.theme.primaryColor,
        width: 30,
        height: 30,
      );
    }

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => navigation!));
      },
      child: Container(
        decoration: new BoxDecoration(
          color: AppTheme.theme.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(width: 1.2, color: AppTheme.theme.primaryColor),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              iconWidget,
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  title!,
                  style: AppCss.getTextStyle(
                    themeData.textTheme.bodyText1!,
                    fontWeight: 700,
                    letterSpacing: 0.3,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
