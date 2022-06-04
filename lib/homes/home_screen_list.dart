import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackit/utility/screen_media.dart';
import 'package:stackit/utility/single_grid_item.dart';
import 'package:stackit/apps/travel/travel_login_screen.dart';

class HomeScreenList extends StatefulWidget {
  const HomeScreenList({Key? key}) : super(key: key);
  @override
  State<HomeScreenList> createState() => _HomeScreenList();
}

class _HomeScreenList extends State<HomeScreenList> {
  int noOfGrid = 7;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        switch (ScreenMedia.getScreenMediaType(constraints.maxWidth)) {
          case ScreenMediaType.XS:
            noOfGrid = 2;
            break;
          case ScreenMediaType.SM:
            noOfGrid = 3;
            break;
          case ScreenMediaType.MD:
            noOfGrid = 4;
            break;
          case ScreenMediaType.LG:
            noOfGrid = 5;
            break;
          case ScreenMediaType.XL:
            noOfGrid = 6;
            break;
          case ScreenMediaType.XXL:
            noOfGrid = 8;
            break;
          case ScreenMediaType.XXXL:
            noOfGrid = 8;
            break;
          case ScreenMediaType.XXXXL:
            noOfGrid = 8;
            break;
        }

        return Container(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 16, left: 8, bottom: 12),
                child: const Text(
                  "APPS",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                crossAxisCount: noOfGrid,
                padding: const EdgeInsets.all(4),
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 16,
                children: const <Widget>[
                  SinglePageItem(
                    iconData: MdiIcons.airplane,
                    navigation: TravelLoginScreen(),
                    title: "Travel",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
