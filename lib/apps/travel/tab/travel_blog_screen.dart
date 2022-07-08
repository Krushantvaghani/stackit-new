/*
* File : Travels Blog
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackit/assets/image_assets.dart';
import 'package:stackit/assets/index.dart';
import 'package:stackit/global/packages/config_package.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';
import 'package:stackit/widgets/custom_card.dart';
import 'package:stackit/widgets/custom_textformfield.dart';

import '../../../assets/index.dart';

class TravelBlogScreen extends StatefulWidget {
  const TravelBlogScreen({Key? key}) : super(key: key);

  @override
  _TravelBlogScreenState createState() => _TravelBlogScreenState();
}

class _TravelBlogScreenState extends State<TravelBlogScreen>
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
                      style: AppCss.getTextStyle(themeData.textTheme.headline5!,
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontSize: 20,
                          fontWeight: 700),
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
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: Spacing.fromLTRB(24, 15, 24, 15),
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
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
                                    hintText: "Search feed",
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
                                Container(
                                  margin: Spacing.right(12),
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary
                                          .withAlpha(100),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Icon(
                                      MdiIcons.microphone,
                                      color: themeData.colorScheme.primary
                                          .withAlpha(200),
                                      size: ScaleSize.size7,
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
                  Spacing.height(10),
                  Padding(
                    padding: Spacing.horizontal(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discoveries",
                          style: AppCss.getTextStyle(
                            themeData.textTheme.subtitle1!,
                            fontWeight: 700,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'See All',
                              style: AppCss.getTextStyle(
                                themeData.textTheme.bodyText2!,
                                fontWeight: 800,
                                color: AppTheme.theme.primaryColor,
                              ),
                            ),
                            Spacing.width(5),
                            Icon(
                              Icons.arrow_forward,
                              color: AppTheme.theme.primaryColor,
                              size: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacing.height(20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: themeData.colorScheme.onPrimary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          margin: Spacing.left(24),
                          child: discoveriesTravelers(
                            image: ImageAssets().sliderImage2,
                            title: "Michaele",
                            imageAvatar: ImageAssets().placeImage1,
                          ),
                        ),
                        Container(
                          margin: Spacing.left(24),
                          child: discoveriesTravelers(
                            image: ImageAssets().sliderImage2,
                            title: "Jennifer",
                            imageAvatar: ImageAssets().placeImage1,
                          ),
                        ),
                        Container(
                          margin: Spacing.left(24),
                          child: discoveriesTravelers(
                            image: ImageAssets().sliderImage2,
                            title: "Mike",
                            imageAvatar: ImageAssets().placeImage1,
                          ),
                        ),
                        Container(
                          margin: Spacing.left(24),
                          child: discoveriesTravelers(
                            image: ImageAssets().sliderImage2,
                            title: "Kieran",
                            imageAvatar: ImageAssets().placeImage1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget discoveriesTravelers({
    required String image,
    required String title,
    String? imageAvatar,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Stack(
        //   clipBehavior: Clip.none,
        //   children: [
        //     ClipRRect(
        //       borderRadius: const BorderRadius.all(
        //         Radius.circular(10),
        //       ),
        //       child: Image(
        //         image: AssetImage(image),
        //         fit: BoxFit.fitWidth,
        //         width: 170,
        //         height: 170,
        //       ),
        //     ),
        //     Positioned(
        //       right: 15,
        //       top: 15,
        //       child: Container(
        //         decoration: BoxDecoration(
        //           color: themeData.colorScheme.onPrimary,
        //           borderRadius: const BorderRadius.all(Radius.circular(50)),
        //         ),
        //         height: 50,
        //         width: 50,
        //         child: CircleAvatar(
        //           backgroundImage: AssetImage(imageAvatar!),
        //           backgroundColor: Colors.transparent,
        //           maxRadius: 25,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        Spacing.height(10),
        // CircleAvatar(
        //   backgroundImage: AssetImage(imageAvatar!),
        //   backgroundColor: Colors.transparent,
        //   maxRadius: 25,
        // ),
        Spacing.height(10),
        Text(
          title,
          style: AppCss.getTextStyle(themeData.textTheme.bodyText1!,
              fontWeight: 700),
        ),
        Spacing.height(10),
      ],
    );
  }
}
