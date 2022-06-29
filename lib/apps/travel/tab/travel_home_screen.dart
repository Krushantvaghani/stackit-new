/*
* File : Travels Home
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackit/assets/index.dart';
import 'package:stackit/images.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';
import 'package:stackit/widgets/custom_card.dart';
import 'package:stackit/widgets/custom_container.dart';
import 'package:stackit/widgets/custom_textformfield.dart';
import 'package:stackit/widgets/rating/star_rating.dart';

import '../../../global/packages/config_package.dart';

class TravelHomeScreen extends StatefulWidget {
  final String? image, name, description;
  final int? star, countStar;
  final double? width;

  const TravelHomeScreen({
    Key? key,
    this.image,
    this.name,
    this.description,
    this.star,
    this.countStar,
    this.width,
  }) : super(key: key);

  @override
  _TravelHomeScreenState createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Animation<Offset>? offset;
  late ThemeData themeData;
  int? selectedCategory = 0;

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
              resizeToAvoidBottomInset: false,
              backgroundColor: AppTheme.theme.cardColor,
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
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
                                      fillColor:
                                          themeData.colorScheme.onPrimary,
                                      hintText: "Where should we go?",
                                      hintStyle: AppCss.getTextStyle(
                                          themeData.textTheme.bodyText2!,
                                          color: themeData
                                              .colorScheme.onBackground,
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
                    Spacing.height(10),
                    Padding(
                      padding: Spacing.fromLTRB(24, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Categories",
                            style: AppCss.getTextStyle(
                              themeData.textTheme.subtitle1!,
                              fontWeight: 700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacing.height(5),
                    CustomContainer(
                      padding: const EdgeInsets.all(0),
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: Spacing.fromLTRB(24, 0, 24, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              categoryWidget(
                                iconData: MdiIcons.airplane,
                                actionText: "Trips",
                                index: 0,
                              ),
                              categoryWidget(
                                  actionText: "Hotel",
                                  iconData: MdiIcons.cityVariant,
                                  index: 2),
                              categoryWidget(
                                  actionText: "Food",
                                  iconData: MdiIcons.coffee,
                                  index: 3),
                              categoryWidget(
                                  actionText: "Transport",
                                  iconData: MdiIcons.rickshaw,
                                  index: 4),
                              categoryWidget(
                                  actionText: "Allocation",
                                  iconData: MdiIcons.collage,
                                  index: 5),
                              Container(
                                child: categoryWidget(
                                    actionText: "Train",
                                    iconData: MdiIcons.train,
                                    index: 6),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacing.height(24),
                    Padding(
                      padding: Spacing.horizontal(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nearby Travelers",
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
                            child: nearbyTravelers(
                              image: ImageAssets().travelerImage1,
                              title: "Michaele Jayde",
                              subTitle: "187 Discoveries",
                              countLike: "2105",
                              likes: "likes",
                            ),
                          ),
                          Container(
                            margin: Spacing.left(24),
                            child: nearbyTravelers(
                              image: ImageAssets().travelerImage2,
                              title: "Erik Padamans",
                              subTitle: "678 Discoveries",
                              countLike: "678",
                              likes: "likes",
                            ),
                          ),
                          Container(
                            margin: Spacing.left(24),
                            child: nearbyTravelers(
                              image: ImageAssets().travelerImage3,
                              title: "Dennis Richhi",
                              subTitle: "204 Discoveries",
                              countLike: "578",
                              likes: "likes",
                            ),
                          ),
                          Container(
                            margin: Spacing.left(24),
                            child: nearbyTravelers(
                              image: ImageAssets().travelerImage4,
                              title: "paul Walker",
                              subTitle: "1450 Discoveries",
                              countLike: "887",
                              likes: "likes",
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(24, 0, 24, 0),
                            child: nearbyTravelers(
                              image: ImageAssets().travelerImage5,
                              title: "Tyler Retriever",
                              subTitle: "417 Discoveries",
                              countLike: "691",
                              likes: "likes",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacing.height(24),
                    Padding(
                      padding: Spacing.horizontal(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Places',
                            style: AppCss.getTextStyle(
                              themeData.textTheme.subtitle1!,
                              fontWeight: 700,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'View all',
                                style: AppCss.getTextStyle(
                                  themeData.textTheme.bodyText2!,
                                  color: AppTheme.theme.primaryColor,
                                  fontWeight: 700,
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
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: buildSinglePlace(
                                image: ImageAssets().placeImage6,
                                beauty1: "Water".toUpperCase(),
                                beauty2: "Nature".toUpperCase(),
                                beauty3: "Adventures".toUpperCase(),
                                title: "Forest Waterfalls",
                                location: "Random Forest, Indonesio",
                                star: 4.5,
                              ),
                            ),
                            Spacing.height(20),
                            Container(
                              child: buildSinglePlace(
                                title: "Beauty of bali",
                                image: ImageAssets().placeImage8,
                                beauty1: "Hill".toUpperCase(),
                                beauty2: "Beautiful".toUpperCase(),
                                beauty3: "Peacefull".toUpperCase(),
                                location: "Avotu iela 104-B",
                                star: 3.5,
                              ),
                            ),
                            Spacing.height(20),
                            Container(
                              child: buildSinglePlace(
                                title: "City of lights",
                                image: ImageAssets().placeImage10,
                                beauty1: "Town".toUpperCase(),
                                beauty2: "Historical".toUpperCase(),
                                beauty3: "For Kids".toUpperCase(),
                                location: "Avotu iela 104-B",
                                star: 4,
                              ),
                            ),
                            Spacing.height(20),
                            Container(
                              child: buildSinglePlace(
                                title: "Sunset water",
                                image: ImageAssets().placeImage3,
                                beauty1: "water".toUpperCase(),
                                beauty2: "active".toUpperCase(),
                                beauty3: "nature".toUpperCase(),
                                location: "Slokas lela 34-A",
                                star: 5,
                              ),
                            ),
                            Spacing.height(20),
                            Container(
                              child: buildSinglePlace(
                                title: "Beauty of NiagaraFalls",
                                image: ImageAssets().placeImage5,
                                beauty1: "water".toUpperCase(),
                                beauty2: "active".toUpperCase(),
                                beauty3: "adventure".toUpperCase(),
                                location: "Ontario iela 104-B",
                                star: 4.75,
                              ),
                            ),
                            Spacing.height(20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget categoryWidget(
      {IconData? iconData, required String actionText, int? index}) {
    bool isSelected = (selectedCategory == index);
    return Container(
      margin: Spacing.fromLTRB(0, 8, 12, 8),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              if (!isSelected) {
                setState(() {
                  selectedCategory = index;
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                              color:
                                  themeData.colorScheme.primary.withAlpha(80),
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: const Offset(0, 2))
                        ]
                      : []),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Material(
                  color: isSelected
                      ? themeData.primaryColor
                      : themeData.backgroundColor,
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(
                      iconData,
                      size: 30,
                      color: isSelected
                          ? themeData.colorScheme.onPrimary
                          : themeData.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              actionText,
              style: AppCss.getTextStyle(
                themeData.textTheme.bodyText2!,
                fontWeight: 700,
                letterSpacing: 0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget travelsPost(
      {required String image,
      required String title,
      int? index,
      IconData? iconData}) {
    bool isFavorite = (selectedCategory == index);
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 15,
              child: Text(
                title,
                style: AppCss.getTextStyle(themeData.textTheme.subtitle2!,
                    fontWeight: 600, color: themeData.colorScheme.onPrimary),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.onPrimary,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                height: 25,
                width: 25,
                child: Icon(
                  MdiIcons.heartOutline,
                  // color: themeData!.colorScheme.onBackground.withAlpha(160),
                  color: themeData.errorColor,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget nearbyTravelers({
    required String image,
    required String title,
    String? subTitle,
    String? likes,
    String? countLike,
    int? index,
    IconData? iconData,
  }) {
    return CustomCard(
      onTap: () {},
      paddingAll: 0,
      borderRadiusAll: 10,
      bordered: false,
      color: AppTheme.theme.backgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.transparent,
              maxRadius: 25,
            ),
            Spacing.height(10),
            Text(
              title,
              style: AppCss.getTextStyle(themeData.textTheme.bodyText1!,
                  fontWeight: 700),
            ),
            Spacing.height(10),
            Text(
              subTitle!,
              style: AppCss.getTextStyle(themeData.textTheme.bodyText2!,
                  fontWeight: 600,
                  color: AppTheme.theme.colorScheme.onBackground.withAlpha(90)),
            ),
            Spacing.height(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  MdiIcons.heart,
                  color: themeData.errorColor,
                  size: 15,
                ),
                Spacing.width(15),
                Text(
                  countLike!,
                  style: AppCss.getTextStyle(themeData.textTheme.bodyText2!,
                      fontWeight: 700),
                ),
                Spacing.width(8),
                Text(
                  likes!,
                  style: AppCss.getTextStyle(themeData.textTheme.bodyText2!,
                      fontWeight: 700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSinglePlace({
    required String image,
    required String title,
    String? location,
    int? distant,
    String? beauty1,
    String? beauty2,
    String? beauty3,
    String? likes,
    double? star,
  }) {
    return CustomCard(
      onTap: () {},
      paddingAll: 0,
      borderRadiusAll: 10,
      bordered: false,
      color: AppTheme.theme.backgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.fitWidth,
                  // width: 300,
                  // height: 200,
                ),
              ),
              Positioned(
                right: 15,
                top: 15,
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.onPrimary,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  height: 30,
                  width: 30,
                  child: Icon(
                    MdiIcons.heart,
                    // color: themeData!.colorScheme.onBackground.withAlpha(160),
                    color: themeData.errorColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      beauty1!,
                      style: AppCss.getTextStyle(themeData.textTheme.overline!,
                          fontWeight: 800, color: themeData.primaryColor),
                      textAlign: TextAlign.left,
                    ),
                    Spacing.width(8),
                    Text(
                      beauty2!,
                      style: AppCss.getTextStyle(themeData.textTheme.overline!,
                          fontWeight: 800, color: themeData.primaryColor),
                    ),
                    Spacing.width(8),
                    Text(
                      beauty3!,
                      style: AppCss.getTextStyle(themeData.textTheme.overline!,
                          fontWeight: 800, color: themeData.primaryColor),
                    ),
                  ],
                ),
                Spacing.height(7),
                Text(
                  title,
                  style: AppCss.getTextStyle(themeData.textTheme.headline6!,
                      fontWeight: 600,
                      fontSize: 20,
                      color: themeData.colorScheme.onBackground),
                ),
                Spacing.height(7),
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
                      location!,
                      style: AppCss.getTextStyle(themeData.textTheme.bodyText2!,
                          fontWeight: 600,
                          color:
                              themeData.colorScheme.onBackground.withAlpha(90)),
                    ),
                  ],
                ),
                Spacing.height(7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        CustomRating(
                            rating: star!,
                            size: 20,
                            inactiveColor: themeData.colorScheme.onBackground),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            star.toString(),
                            style: AppCss.getTextStyle(
                                themeData.textTheme.bodyText2!,
                                fontWeight: 600,
                                color: themeData.colorScheme.onBackground),
                          ),
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
    );
  }
}
