/*
* File : Travels Home
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackit/assets/index.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';
import 'package:stackit/widgets/custom_card.dart';
import 'package:stackit/widgets/custom_container.dart';
import 'package:stackit/widgets/custom_textformfield.dart';

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
              backgroundColor: AppTheme.theme.backgroundColor,
              appBar: AppBar(
                titleSpacing: 0,
                elevation: 0,
                backgroundColor: Colors.white,
                title: Padding(
                  padding: Spacing.left(20),
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
                    padding: Spacing.right(20),
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
                      margin: Spacing.fromLTRB(20, 15, 20, 15),
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
                    Padding(
                      padding: Spacing.fromLTRB(20, 0, 8, 0),
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
                          padding: Spacing.fromLTRB(20, 0, 8, 0),
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
                                margin: Spacing.right(24),
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
                            'Recommended',
                            style: AppCss.getTextStyle(
                              themeData.textTheme.bodyText2!,
                              fontWeight: 700,
                            ),
                          ),
                          Text(
                            'More',
                            style: AppCss.getTextStyle(
                              themeData.textTheme.bodyText2!,
                              fontWeight: 700,
                              muted: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacing.height(16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: Spacing.left(24),
                            child: travelsPost(
                                title: "Flutter Test",
                                image: imageAssets.sliderImage1),
                          ),
                          Container(
                            margin: Spacing.left(24),
                            child: travelsPost(
                                title: "Flutter Test",
                                image: imageAssets.sliderImage2),
                          ),
                          Container(
                            margin: Spacing.left(24),
                            child: travelsPost(
                                title: "Flutter Test",
                                image: imageAssets.sliderImage3),
                          ),
                          Container(
                            margin: Spacing.left(24),
                            child: travelsPost(
                              title: "Flutter Test",
                              image: imageAssets.sliderImage4,
                              iconData: MdiIcons.heart,
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
                            'Popular',
                            style: AppCss.getTextStyle(
                              themeData.textTheme.bodyText2!,
                              fontWeight: 700,
                            ),
                          ),
                          Text(
                            'View all',
                            style: AppCss.getTextStyle(
                              themeData.textTheme.bodyText2!,
                              fontWeight: 700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacing.height(16),
                    SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: Spacing.left(24),
                            child: buildSinglePlace(
                              image: imageAssets.placeImage5,
                              placesName: "Canada",
                              placesPrice: "1200 par night",
                            ),
                          ),
                          Container(
                            margin: Spacing.left(24),
                            child: buildSinglePlace(
                              placesName: "Canada",
                              placesPrice: "1200 par night",
                              image: imageAssets.placeImage1,
                            ),
                          ),
                          Container(
                            margin: Spacing.left(24),
                            child: buildSinglePlace(
                              placesName: "Canada",
                              placesPrice: "1200 par night",
                              image: imageAssets.placeImage3,
                            ),
                          ),
                          Container(
                            margin: Spacing.left(24),
                            child: buildSinglePlace(
                              placesName: "Canada",
                              placesPrice: "1200 par night",
                              image: imageAssets.placeImage10,
                            ),
                          ),
                          Container(
                            margin: Spacing.left(24),
                            child: buildSinglePlace(
                              placesName: "Canada",
                              placesPrice: "1200 par night",
                              image: imageAssets.placeImage4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacing.height(24),
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
                      : themeData.colorScheme.onBackground.withAlpha(30),
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
                fontWeight: 700, letterSpacing: 0,
                // themeData.textTheme.bodyText2!,
                // fontWeight: 600,
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

  Widget travelsPlaces(
      {required String image,
      required String title,
      required String price,
      int? index,
      IconData? iconData}) {
    return Container();
  }

  Widget buildSinglePlace({
    required String image,
    required String placesName,
    required String placesPrice,
  }) {
    return CustomCard(
      onTap: () {},
      paddingAll: 0,
      borderRadiusAll: 16,
      bordered: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.fitWidth,
              width: 300,
              height: 180,
            ),
          ),
          CustomContainer(
            paddingAll: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      placesName,
                      style: AppCss.getTextStyle(themeData.textTheme.bodyText1!,
                          fontWeight: 600,
                          color: themeData.colorScheme.onBackground),
                      textAlign: TextAlign.left,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        placesPrice,
                        style: AppCss.getTextStyle(
                            themeData.textTheme.bodyText1!,
                            fontWeight: 600,
                            color: themeData.colorScheme.onBackground),
                      ),
                    ),
                  ],
                ),
                Spacing.height(4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
