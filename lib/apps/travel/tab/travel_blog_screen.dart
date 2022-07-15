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
import 'package:stackit/widgets/custom_container.dart';
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
              backgroundColor: AppTheme.theme.cardColor,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                titleSpacing: 0,
                backgroundColor: Colors.white,
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
                          margin: Spacing.left(24),
                          child: discoveriesTravelers(
                            image: ImageAssets().recommended1,
                            title: "Michaele",
                            imageAvatar: ImageAssets().travelers1,
                          ),
                        ),
                        Container(
                          margin: Spacing.left(24),
                          child: discoveriesTravelers(
                            image: ImageAssets().recommended3,
                            title: "Jennifer",
                            imageAvatar: ImageAssets().travelers2,
                          ),
                        ),
                        Container(
                          margin: Spacing.left(24),
                          child: discoveriesTravelers(
                            image: ImageAssets().recommended8,
                            title: "Mike",
                            imageAvatar: ImageAssets().travelers4,
                          ),
                        ),
                        Container(
                          margin: Spacing.left(24),
                          child: discoveriesTravelers(
                            image: ImageAssets().recommended5,
                            title: "Kieran",
                            imageAvatar: ImageAssets().travelers7,
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 0, 24, 0),
                          child: discoveriesTravelers(
                            image: ImageAssets().recommended12,
                            title: "Johnny",
                            imageAvatar: ImageAssets().travelers6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacing.height(20),
                  SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: discoveriesTravelersDetails(
                              imageAvatar: ImageAssets().travelers6,
                              title: "Daniele Sanders",
                              subtitle:
                                  "Just visited this awesome place first time in my life. Check out the photos!",
                              time: "38 Minutes ago",
                              sliderImage: ImageAssets().recommended2,
                              sliderImage2: ImageAssets().recommended3,
                              sliderImage3: ImageAssets().recommended5,
                              like: "2500 likes",
                              comments: "12 comments",
                            ),
                          ),
                          Spacing.height(20),
                          Container(
                            child: discoveriesTravelersDetails(
                              imageAvatar: ImageAssets().travelers3,
                              title: "Rose Bertram",
                              subtitle:
                                  "I love travelling and i do enjoy taking photos. Check out the photos!",
                              time: "02 Hours ago",
                              sliderImage: ImageAssets().recommended4,
                              sliderImage2: ImageAssets().recommended6,
                              sliderImage3: ImageAssets().recommended8,
                              like: "3250 likes",
                              comments: "45 comments",
                            ),
                          ),
                          Spacing.height(20),
                          Container(
                            child: discoveriesTravelersDetails(
                              imageAvatar: ImageAssets().travelers8,
                              title: "Harry Wood",
                              subtitle:
                                  "Just visited this awesome place first time in my life. Check out the photos!",
                              time: "15 Minutes ago",
                              sliderImage: ImageAssets().recommended8,
                              sliderImage2: ImageAssets().recommended9,
                              sliderImage3: ImageAssets().recommended10,
                              like: "1500 likes",
                              comments: "87 comments",
                            ),
                          ),
                          Spacing.height(20),
                          Container(
                            child: discoveriesTravelersDetails(
                              imageAvatar: ImageAssets().travelers5,
                              title: "Alexander Sanders",
                              subtitle:
                                  "Just visited this awesome place first time in my life. Check out the photos!",
                              time: "05 Hours ago",
                              sliderImage: ImageAssets().recommended12,
                              sliderImage2: ImageAssets().recommended4,
                              sliderImage3: ImageAssets().recommended6,
                              like: "1980 likes",
                              comments: "65 comments",
                            ),
                          ),
                          Spacing.height(20),
                          Container(
                            child: discoveriesTravelersDetails(
                              imageAvatar: ImageAssets().travelers1,
                              title: "Thomas Joe",
                              subtitle:
                                  "Just visited this awesome place first time in my life. Check out the photos!",
                              time: "07 Hours ago",
                              sliderImage: ImageAssets().recommended2,
                              sliderImage2: ImageAssets().recommended9,
                              sliderImage3: ImageAssets().recommended8,
                              like: "2784 likes",
                              comments: "85 comments",
                            ),
                          ),
                          Spacing.height(20),
                        ],
                      ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          width: 130,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Spacing.height(15),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: themeData.colorScheme.onPrimary, width: 2),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(imageAvatar!),
                  maxRadius: 25,
                ),
              ),
              Spacing.height(40),
              Text(
                title,
                style: AppCss.getTextStyle(themeData.textTheme.bodyText1!,
                    fontWeight: 700, color: themeData.colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget discoveriesTravelersDetails({
    required String title,
    String? subtitle,
    String? time,
    String? sliderImage,
    String? sliderImage2,
    String? sliderImage3,
    String? imageAvatar,
    String? like,
    String? comments,
  }) {
    return CustomCard(
      onTap: () {},
      paddingAll: 15,
      borderRadiusAll: 10,
      bordered: false,
      color: AppTheme.theme.backgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
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
                          color: themeData.colorScheme.onBackground, width: 2),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imageAvatar!),
                      maxRadius: 25,
                    ),
                  ),
                  Spacing.width(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppCss.getTextStyle(
                            themeData.textTheme.headline6!,
                            fontWeight: 700,
                            fontSize: 20,
                            color: themeData.colorScheme.onBackground),
                      ),
                      Text(
                        time!,
                        style: AppCss.getTextStyle(
                            themeData.textTheme.bodyText2!,
                            fontWeight: 600,
                            color: AppTheme.theme.colorScheme.onBackground
                                .withAlpha(90)),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.more_horiz,
                color: themeData.colorScheme.secondary.withAlpha(200),
                size: 30,
              ),
            ],
          ),
          Spacing.height(20),
          Text(
            subtitle!,
            style: AppCss.getTextStyle(
              themeData.textTheme.bodyText1!,
              fontWeight: 600,
              color: themeData.colorScheme.onBackground,
            ),
          ),
          Spacing.height(20),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Image(
                    image: AssetImage(sliderImage!),
                    fit: BoxFit.fitWidth,
                    height: 100,
                  ),
                ),
              ),
              Spacing.width(20),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Image(
                    image: AssetImage(sliderImage2!),
                    fit: BoxFit.fitWidth,
                    height: 100,
                  ),
                ),
              ),
              Spacing.width(20),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Image(
                    image: AssetImage(sliderImage3!),
                    fit: BoxFit.fitWidth,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          Spacing.height(20),
          Row(
            children: [
              Row(
                children: [
                  CustomContainer(
                    paddingAll: 0,
                    color: themeData.colorScheme.primary.withAlpha(30),
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
                    like!,
                    style: AppCss.getTextStyle(themeData.textTheme.bodyText1!,
                        fontWeight: 600,
                        color:
                            themeData.colorScheme.onBackground.withAlpha(90)),
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
                    color: themeData.colorScheme.onBackground.withAlpha(20),
                    child: Icon(
                      MdiIcons.chat,
                      color: themeData.colorScheme.onBackground.withAlpha(150),
                      size: 20,
                    ),
                  ),
                  Spacing.width(20),
                  Text(
                    comments!,
                    style: AppCss.getTextStyle(themeData.textTheme.bodyText1!,
                        fontWeight: 600,
                        color:
                            themeData.colorScheme.onBackground.withAlpha(90)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
