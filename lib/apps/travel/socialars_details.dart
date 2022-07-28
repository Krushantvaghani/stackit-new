import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';
import 'package:stackit/utility/size_config.dart';
import 'package:stackit/widgets/custom_container.dart';

class SocialarDetails extends StatefulWidget {
  final String heroTag,
      imageAvatar,
      title,
      subtitle,
      time,
      like,
      comments,
      sliderImage,
      sliderImage2,
      sliderImage3;

  const SocialarDetails({
    Key? key,
    this.heroTag = "heroTag",
    this.imageAvatar = './assets/product/product-5.jpg',
    this.title = "traveller pages",
    this.subtitle = "this is new data",
    this.time = "38 minutes",
    this.like = "230 likes",
    this.comments = "12 comments",
    this.sliderImage = "slider image 1",
    this.sliderImage2 = "slider image 2",
    this.sliderImage3 = "slider image 3",
  }) : super(key: key);

  @override
  State<SocialarDetails> createState() => _SocialarDetailsState();
}

class _SocialarDetailsState extends State<SocialarDetails>
    with SingleTickerProviderStateMixin {
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
    return Consumer<AppThemeNotifier?>(builder:
        (BuildContext context, AppThemeNotifier? value, Widget? child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: AppTheme.theme.cardColor,
            body: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                Stack(
                  children: [
                    Image(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      image: AssetImage(widget.sliderImage),
                    ),
                    Positioned(
                      left: 24,
                      top: 20,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: themeData.colorScheme.onPrimary,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            FeatherIcons.arrowLeft,
                            size: 20,
                            color: themeData.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: themeData.colorScheme.onBackground,
                                      width: 2),
                                ),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(widget.imageAvatar),
                                  maxRadius: 25,
                                ),
                              ),
                              Spacing.width(20),
                              Column(
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
                                  Text(
                                    widget.time,
                                    style: AppCss.getTextStyle(
                                        themeData.textTheme.bodyText2!,
                                        fontWeight: 600,
                                        color: AppTheme
                                            .theme.colorScheme.onBackground
                                            .withAlpha(150)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.more_horiz,
                            color:
                                themeData.colorScheme.secondary.withAlpha(200),
                            size: 30,
                          ),
                        ],
                      ),
                      Spacing.height(20),
                      Text(
                        widget.subtitle,
                        style: AppCss.getTextStyle(
                          themeData.textTheme.bodyText1!,
                          fontWeight: 600,
                          color:
                              themeData.colorScheme.onBackground.withAlpha(150),
                        ),
                      ),
                      Spacing.height(20),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.sliderImage),
                              height: 100,
                              width: 100,
                              // fit: BoxFit.fitWidth,
                            ),
                          ),
                          Spacing.width(20),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.sliderImage2),
                              height: 100,
                              width: 100,
                              // fit: BoxFit.fitWidth,
                            ),
                          ),
                          Spacing.width(20),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.sliderImage3),
                              height: 100,
                              width: 100,
                              // fit: BoxFit.fitWidth,
                            ),
                          ),
                          // Column(
                          //   children: [
                          //     Row(
                          //       children: [
                          //         ClipRRect(
                          //           borderRadius: const BorderRadius.all(
                          //             Radius.circular(10),
                          //           ),
                          //           child: Image(
                          //             image: AssetImage(widget.sliderImage2),
                          //             fit: BoxFit.cover,
                          //             height: 100,
                          //           ),
                          //         ),
                          //         Spacing.width(20),
                          //         ClipRRect(
                          //           borderRadius: const BorderRadius.all(
                          //             Radius.circular(10),
                          //           ),
                          //           child: Image(
                          //             image: AssetImage(widget.sliderImage3),
                          //             fit: BoxFit.cover,
                          //             width: 100,
                          //             height: 100,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     Spacing.height(20),
                          //     Row(
                          //       children: [
                          //         ClipRRect(
                          //           borderRadius: const BorderRadius.all(
                          //             Radius.circular(10),
                          //           ),
                          //           child: Image(
                          //             image: AssetImage(widget.sliderImage2),
                          //             fit: BoxFit.cover,
                          //             width: 100,
                          //             height: 100,
                          //           ),
                          //         ),
                          //         Spacing.width(20),
                          //         ClipRRect(
                          //           borderRadius: const BorderRadius.all(
                          //             Radius.circular(10),
                          //           ),
                          //           child: Image(
                          //             image: AssetImage(widget.sliderImage3),
                          //             fit: BoxFit.cover,
                          //             width: 100,
                          //             height: 100,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      Spacing.height(20),
                      Row(
                        children: [
                          Row(
                            children: [
                              CustomContainer(
                                paddingAll: 0,
                                color:
                                    themeData.colorScheme.primary.withAlpha(30),
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
                                widget.like,
                                style: AppCss.getTextStyle(
                                    themeData.textTheme.bodyText1!,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onBackground
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
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(20),
                                child: Icon(
                                  MdiIcons.chat,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(150),
                                  size: 20,
                                ),
                              ),
                              Spacing.width(20),
                              Text(
                                widget.comments,
                                style: AppCss.getTextStyle(
                                    themeData.textTheme.bodyText1!,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(150)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
