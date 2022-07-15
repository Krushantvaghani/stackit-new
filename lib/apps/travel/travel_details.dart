import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackit/assets/index.dart';
import 'package:stackit/global/packages/config_package.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';
import 'package:stackit/utility/size_config.dart';
import 'package:stackit/widgets/custom_textformfield.dart';

class TravelDetails extends StatefulWidget {
  const TravelDetails({Key? key}) : super(key: key);

  @override
  _TravelDetailsState createState() => _TravelDetailsState();
}

class _TravelDetailsState extends State<TravelDetails> {
  late ThemeData themeData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeData = AppTheme.theme;
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
                titleSpacing: 0,
                elevation: 0,
                backgroundColor: Colors.white,
                title: Padding(
                  padding: Spacing.left(24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Travel Camp',
                      style: AppCss.getTextStyle(themeData.textTheme.headline5!,
                          fontSize: 20,
                          fontWeight: 700,
                          color: themeData.colorScheme.onBackground),
                    ),
                  ),
                ),
                actions: [
                  Container(
                    padding: Spacing.right(24),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imageAssets.profileImage),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Container(
                    margin: Spacing.all(24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            padding: Spacing.vertical(4),
                            decoration: BoxDecoration(
                              color: themeData.colorScheme.onPrimary,
                              border: Border.all(
                                  color: themeData.colorScheme.primary,
                                  width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: Spacing.left(12),
                                  child: Icon(
                                    MdiIcons.magnify,
                                    color: themeData.colorScheme.primary
                                        .withAlpha(200),
                                    size: ScaleSize.size16,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextFormField(
                                    padding: 0,
                                    style: AppCss.getTextStyle(
                                        themeData.textTheme.bodyText2!,
                                        color: themeData.colorScheme.primary,
                                        fontWeight: 500),
                                    fillColor: themeData.colorScheme.onPrimary,
                                    hintText: "Waterfalls World",
                                    hintStyle: AppCss.getTextStyle(
                                        themeData.textTheme.bodyText2!,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        muted: true,
                                        fontWeight: 700,
                                        letterSpacing: 0),
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                ),
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
