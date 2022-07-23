/*
* File : Travels Search
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stackit/apps/travel/travel_details.dart';
import 'package:stackit/assets/image_assets.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';
import 'package:stackit/utility/generator.dart';
import 'package:stackit/utility/size_config.dart';
import 'package:stackit/widgets/custom_card.dart';
import 'package:stackit/widgets/custom_container.dart';
import 'package:stackit/widgets/custom_textformfield.dart';
import 'package:stackit/widgets/rating/star_rating.dart';

class TravelSearchScreen extends StatefulWidget {
  const TravelSearchScreen({Key? key}) : super(key: key);

  @override
  _TravelSearchScreenState createState() => _TravelSearchScreenState();
}

class _TravelSearchScreenState extends State<TravelSearchScreen>
    with SingleTickerProviderStateMixin {
  int selectedCategory = 0;
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
              resizeToAvoidBottomInset: false,
              backgroundColor: AppTheme.theme.cardColor,
              body: SingleChildScrollView(
                child: Column(
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
                                      fillColor:
                                          themeData.colorScheme.onPrimary,
                                      hintText: "Waterfalls World",
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: Spacing.fromLTRB(24, 0, 24, 0),
                        child: Row(
                          children: [
                            buildSingleDistance(
                              name: "50 - 100 km",
                              index: 0,
                            ),
                            buildSingleDistance(
                              name: "Ratting",
                              index: 2,
                            ),
                            buildSingleDistance(
                              name: "Filters",
                              index: 3,
                            ),
                            buildSingleDistance(
                              name: "30 - 50 km",
                              index: 4,
                            ),
                            buildSingleDistance(
                              name: "Ratting",
                              index: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacing.height(40),
                    Padding(
                      padding: Spacing.horizontal(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '150 results found',
                            style: AppCss.getTextStyle(
                              themeData.textTheme.headline5!,
                              fontWeight: 700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacing.height(40),
                    SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: buildSinglePlace(
                                image: ImageAssets().placeImage4,
                                beauty1: "Water".toUpperCase(),
                                beauty2: "Nature".toUpperCase(),
                                beauty3: "Adventures".toUpperCase(),
                                title: "Forest Waterfalls",
                                location: "Random Forest, Indonesio",
                                star: 4.5,
                                rootContext: context,
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
                                rootContext: context,
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
                                rootContext: context,
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
                                rootContext: context,
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
                                rootContext: context,
                              ),
                            ),
                            Spacing.height(20),
                            // TravelListWidget(
                            //   image: ImageAssets().placeImage4,
                            //   beauty1: "Water".toUpperCase(),
                            //   beauty2: "Nature".toUpperCase(),
                            //   beauty3: "Adventures".toUpperCase(),
                            //   title: "Forest Waterfalls",
                            //   location: "Random Forest, Indonesio",
                            //   star: 4.5,
                            //   rootContext: context,
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSingleDistance({
    int? index,
    String? name,
  }) {
    bool isSelected = (selectedCategory == index);
    return Padding(
      padding: Spacing.right(16),
      child: CustomContainer(
        paddingAll: 8,
        borderRadiusAll: 8,
        bordered: true,
        border: Border.all(color: themeData.colorScheme.primary, width: 1),
        color: selectedCategory == index
            ? themeData.colorScheme.primary
            : themeData.backgroundColor,
        onTap: () {
          if (!isSelected) {
            setState(() {
              selectedCategory = index!;
            });
          }
        },
        child: Row(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                name!,
                style: AppCss.getTextStyle(themeData.textTheme.bodyText2!,
                    color: selectedCategory == index
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.primary,
                    fontWeight: 600,
                    letterSpacing: 0),
              ),
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
    double? star,
    BuildContext? rootContext,
  }) {
    String key = Generator.randomString(10);
    return CustomCard(
      onTap: () {
        Navigator.push(
          rootContext!,
          MaterialPageRoute(
            builder: (context) => TravelDetails(
              heroTag: key,
              image: image,
              title: title,
              beauty1: beauty1!,
              beauty3: beauty3!,
              beauty2: beauty2!,
              location: location!,
              star: star!,
            ),
          ),
        );
      },
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
                          color: themeData.colorScheme.onBackground
                              .withAlpha(150)),
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
