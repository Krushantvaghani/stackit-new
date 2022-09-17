import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';
import 'package:stackit/utility/size_config.dart';
import 'package:stackit/widgets/custom_container.dart';

class TravelerDetails extends StatefulWidget {
  final String heroTag, image, title;
  const TravelerDetails({
    Key? key,
    this.heroTag = "heroTag",
    this.image = './assets/product/product-5.jpg',
    this.title = "traveller pages",
  }) : super(key: key);

  @override
  State<TravelerDetails> createState() => _TravelerDetailsState();
}

class _TravelerDetailsState extends State<TravelerDetails> {
  late ThemeData themeData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeData = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier?>(
      builder: (BuildContext context, AppThemeNotifier? value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: AppTheme.theme.cardColor,
            appBar: AppBar(
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: AppTheme.theme.cardColor,
              title: Padding(
                padding: Spacing.left(24),
                child: const Align(
                  alignment: Alignment.centerLeft,
                ),
              ),
              actions: [
                Container(
                  padding: Spacing.right(30),
                  child: Icon(
                    MdiIcons.accountPlus,
                    color: themeData.colorScheme.primary.withAlpha(200),
                    size: ScaleSize.size40,
                  ),
                ),
              ],
            ),
            body: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(widget.image),
                              maxRadius: 45,
                            ),
                            Spacing.width(20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: AppCss.getTextStyle(
                                        themeData.textTheme.headline6!,
                                        fontWeight: 700,
                                        fontSize: 20,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ),
                                  Spacing.height(10),
                                  Text(
                                    "Passionate about discovery. I enjoy travel & discoveries.",
                                    style: AppCss.getTextStyle(
                                      themeData.textTheme.bodyText1!,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(150),
                                    ),
                                  ),
                                  Spacing.height(10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.mapMarker,
                                        color: themeData.primaryColor,
                                        size: 15,
                                      ),
                                      Spacing.width(8),
                                      Text(
                                        'Niagara falls, Canada',
                                        style: AppCss.getTextStyle(
                                          themeData.textTheme.bodyText2!,
                                          fontWeight: 600,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(150),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Spacing.height(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discovered".toUpperCase(),
                              style: AppCss.getTextStyle(
                                themeData.textTheme.caption!,
                                fontWeight: 600,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(150),
                              ),
                            ),
                            Text(
                              "Followers".toUpperCase(),
                              style: AppCss.getTextStyle(
                                themeData.textTheme.caption!,
                                fontWeight: 600,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(150),
                              ),
                            ),
                            Text(
                              "km Traveled".toUpperCase(),
                              style: AppCss.getTextStyle(
                                themeData.textTheme.caption!,
                                fontWeight: 600,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(150),
                              ),
                            ),
                          ],
                        ),
                        Spacing.height(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "22",
                              style: AppCss.getTextStyle(
                                  themeData.textTheme.headline6!,
                                  fontWeight: 700,
                                  fontSize: 20,
                                  color: themeData.colorScheme.onBackground),
                            ),
                            Text(
                              "368",
                              style: AppCss.getTextStyle(
                                  themeData.textTheme.headline6!,
                                  fontWeight: 700,
                                  fontSize: 20,
                                  color: themeData.colorScheme.onBackground),
                            ),
                            Text(
                              "1689",
                              style: AppCss.getTextStyle(
                                  themeData.textTheme.headline6!,
                                  fontWeight: 700,
                                  fontSize: 20,
                                  color: themeData.colorScheme.onBackground),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: Spacing.top(25),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.onBackground.withAlpha(30),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35)),
                      ),
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: Spacing.fromLTRB(24, 24, 15, 0),
                                  decoration: const BoxDecoration(),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Material(
                                      color: themeData.colorScheme.onPrimary,
                                      child: SizedBox(
                                        width: 75,
                                        height: 75,
                                        child: Icon(
                                          MdiIcons.mapMarker,
                                          size: 30,
                                          color: themeData.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: Spacing.fromLTRB(0, 24, 15, 0),
                                  decoration: const BoxDecoration(),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Material(
                                      color: themeData.colorScheme.onPrimary,
                                      child: SizedBox(
                                        width: 75,
                                        height: 75,
                                        child: Icon(
                                          MdiIcons.waterfall,
                                          size: 30,
                                          color: themeData.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: Spacing.fromLTRB(0, 24, 15, 0),
                                  decoration: const BoxDecoration(),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Material(
                                      color: themeData.colorScheme.onPrimary,
                                      child: SizedBox(
                                        width: 75,
                                        height: 75,
                                        child: Icon(
                                          MdiIcons.pineTree,
                                          size: 30,
                                          color: themeData.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: Spacing.fromLTRB(0, 24, 24, 0),
                                  decoration: const BoxDecoration(),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Material(
                                      color: themeData.colorScheme.onPrimary,
                                      child: SizedBox(
                                        width: 75,
                                        height: 75,
                                        child: Icon(
                                          MdiIcons.earth,
                                          size: 30,
                                          color: themeData.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 125, 24, 24),
                            child: Container(
                              height: 280,
                              decoration: BoxDecoration(
                                color: themeData.colorScheme.onPrimary,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: themeData
                                                        .colorScheme.primary,
                                                    width: 2),
                                              ),
                                              child: CircleAvatar(
                                                backgroundImage:
                                                    AssetImage(widget.image),
                                                maxRadius: 20,
                                              ),
                                            ),
                                            Spacing.width(15),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.title,
                                                  style: AppCss.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText1!,
                                                      fontWeight: 700),
                                                ),
                                                Text(
                                                  "1 hour 20 minutes ago",
                                                  style: AppCss.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText2!,
                                                    fontWeight: 600,
                                                    color: AppTheme
                                                        .theme
                                                        .colorScheme
                                                        .onBackground
                                                        .withAlpha(150),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: themeData.colorScheme.secondary
                                              .withAlpha(200),
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    Spacing.height(20),
                                    Text(
                                      "Hey, can you please recommend me a nice place to explore? In Canada.",
                                      style: AppCss.getTextStyle(
                                        themeData.textTheme.bodyText1!,
                                        fontWeight: 600,
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(150),
                                      ),
                                    ),
                                    Spacing.height(20),
                                    Divider(thickness: 1.5),
                                    Spacing.height(20),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            CustomContainer(
                                              paddingAll: 0,
                                              color: themeData
                                                  .colorScheme.primary
                                                  .withAlpha(30),
                                              height: 30,
                                              width: 30,
                                              child: Icon(
                                                MdiIcons.heart,
                                                color: themeData.errorColor,
                                                size: 20,
                                              ),
                                            ),
                                            Spacing.width(20),
                                            Text(
                                              "1578 likes",
                                              style: AppCss.getTextStyle(
                                                  themeData
                                                      .textTheme.bodyText1!,
                                                  fontWeight: 600,
                                                  color: themeData
                                                      .colorScheme.onBackground
                                                      .withAlpha(150)),
                                            ),
                                          ],
                                        ),
                                        Spacing.width(20),
                                        Row(
                                          children: [
                                            CustomContainer(
                                              paddingAll: 0,
                                              height: 30,
                                              width: 30,
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(20),
                                              child: Icon(
                                                MdiIcons.chat,
                                                color: themeData
                                                    .colorScheme.onBackground
                                                    .withAlpha(150),
                                                size: 20,
                                              ),
                                            ),
                                            Spacing.width(20),
                                            Text(
                                              "05 comments",
                                              style: AppCss.getTextStyle(
                                                  themeData
                                                      .textTheme.bodyText1!,
                                                  fontWeight: 600,
                                                  color: themeData
                                                      .colorScheme.onBackground
                                                      .withAlpha(150)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
