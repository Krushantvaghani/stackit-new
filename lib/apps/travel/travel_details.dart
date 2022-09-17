import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stackit/images.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/theme/app_theme_notifier.dart';
import 'package:stackit/utility/size_config.dart';
import 'package:stackit/widgets/rating/star_rating.dart';

class TravelDetails extends StatefulWidget {
  final String heroTag, image, title, location, beauty1, beauty2, beauty3;

  final double star;

  const TravelDetails({
    Key? key,
    this.heroTag = "heroTag",
    this.image = './assets/product/product-5.jpg',
    this.title = "city of beauty",
    this.location = 'India',
    this.star = 4.5,
    this.beauty3 = "Adventures",
    this.beauty2 = "Nature",
    this.beauty1 = "Water",
  }) : super(key: key);

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
              body: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  Stack(
                    children: [
                      Image(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        image: AssetImage(widget.image),
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
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 200,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withAlpha(220),
                                  Colors.black.withAlpha(180),
                                  Colors.black.withAlpha(160),
                                  Colors.black.withAlpha(140),
                                  Colors.transparent
                                ],
                                stops: [
                                  0.1,
                                  0.25,
                                  0.5,
                                  0.7,
                                  1
                                ]),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        bottom: 20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Image(
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                                image: AssetImage(ImageAssets().placeImage1),
                              ),
                            ),
                            Spacing.width(15),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Image(
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                                image: AssetImage(ImageAssets().placeImage2),
                              ),
                            ),
                            Spacing.width(15),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Image(
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                                image: AssetImage(ImageAssets().placeImage3),
                              ),
                            ),
                            Spacing.width(15),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Image(
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                                image: AssetImage(ImageAssets().placeImage4),
                              ),
                            ),
                          ],
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
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                color: themeData.colorScheme.onPrimary,
                                border: Border.all(
                                    color: themeData.colorScheme.primary,
                                    width: 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Text(
                                widget.beauty1,
                                style: AppCss.getTextStyle(
                                    themeData.textTheme.overline!,
                                    fontWeight: 600,
                                    color: themeData.primaryColor),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Spacing.width(8),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                color: themeData.colorScheme.onPrimary,
                                border: Border.all(
                                    color: themeData.colorScheme.primary,
                                    width: 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Text(
                                widget.beauty2,
                                style: AppCss.getTextStyle(
                                    themeData.textTheme.overline!,
                                    fontWeight: 600,
                                    color: themeData.primaryColor),
                              ),
                            ),
                            Spacing.width(8),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                color: themeData.colorScheme.onPrimary,
                                border: Border.all(
                                    color: themeData.colorScheme.primary,
                                    width: 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Text(
                                widget.beauty3,
                                style: AppCss.getTextStyle(
                                    themeData.textTheme.overline!,
                                    fontWeight: 600,
                                    color: themeData.primaryColor),
                              ),
                            ),
                          ],
                        ),
                        Spacing.height(10),
                        Text(
                          widget.title,
                          style: AppCss.getTextStyle(
                              themeData.textTheme.headline5!,
                              fontWeight: 600,
                              fontSize: 30,
                              color: themeData.colorScheme.onBackground),
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
                              widget.location,
                              style: AppCss.getTextStyle(
                                  themeData.textTheme.bodyText2!,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(150)),
                            ),
                          ],
                        ),
                        Spacing.height(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                CustomRating(
                                    rating: widget.star,
                                    size: 22,
                                    inactiveColor:
                                        themeData.colorScheme.onBackground),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    widget.star.toString(),
                                    style: AppCss.getTextStyle(
                                        themeData.textTheme.bodyText2!,
                                        fontWeight: 600,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacing.height(10),
                        Text(
                          'Overview',
                          style: AppCss.getTextStyle(
                              themeData.textTheme.bodyText1!,
                              fontWeight: 700,
                              color: themeData.colorScheme.primary),
                        ),
                        Spacing.height(15),
                        Text(
                          "Latvia'\s' capital Riga is enriched and inspired every day by its multicultural community. Riga is perhaps the most.",
                          style: AppCss.getTextStyle(
                              themeData.textTheme.bodyText2!,
                              fontWeight: 600,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(150)),
                        ),
                        Spacing.height(10),
                        Text(
                          "Read more",
                          style: AppCss.getTextStyle(
                            themeData.textTheme.bodyText2!,
                            fontWeight: 700,
                            color: themeData.colorScheme.primary.withAlpha(400),
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
