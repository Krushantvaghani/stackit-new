import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackit/apps/travel/routes/route_screen_list.dart';
import 'package:stackit/global/packages/config_package.dart';
import 'package:stackit/theme/app_theme.dart';

class TravelScreen extends StatefulWidget {
  const TravelScreen({Key? key}) : super(key: key);

  @override
  _TravelScreenState createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen>
    with SingleTickerProviderStateMixin {
  late ThemeData theme;

  int? _currentIndex = 0;
  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  // oninitStare method
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex! > 0.5) {
        setState(() {
          _currentIndex = _currentIndex! + 1;
        });
      } else if (aniValue - _currentIndex! < -0.5) {
        setState(() {
          _currentIndex = _currentIndex! - 1;
        });
      }
    });
    theme = AppTheme.theme;
    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier?>(
      builder: (BuildContext context, AppNotifier? value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value!.themeMode()),
          home: Scaffold(
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              shape: CircularNotchedRectangle(),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.onBackground,
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary,
                      offset: Offset(0, -3),
                    )
                  ],
                ),
                padding: EdgeInsets.only(top: 12, bottom: 12),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: theme.colorScheme.onBackground,
                  tabs: <Widget>[
                    Container(
                      child: (_currentIndex == 0)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  MdiIcons.store,
                                  color: theme.primaryColor,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(2.5))),
                                  height: 5,
                                  width: 5,
                                )
                              ],
                            )
                          : Icon(
                              MdiIcons.storeOutline,
                              color: theme.primaryColor,
                            ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 0),
                        child: (_currentIndex == 1)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.magnify,
                                    color: theme.primaryColor,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.magnify,
                                color: theme.primaryColor,
                              )),
                    Container(
                        margin: EdgeInsets.only(left: 0),
                        child: (_currentIndex == 2)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.tag,
                                    color: theme.primaryColor,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.tagOutline,
                                color: theme.primaryColor,
                              )),
                    Container(
                        child: (_currentIndex == 3)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.account,
                                    color: theme.primaryColor,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.accountOutline,
                                color: theme.primaryColor,
                              )),
                  ],
                ),
              ),
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) {
            //         // return ShoppingCartScreen();
            //         return Container();
            //       }),
            //     );
            //   },
            //   child: Icon(
            //     MdiIcons.cartOutline,
            //     color: appColor.primary,
            //   ),
            //   backgroundColor: appColor.white,
            // ),
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerDocked,
            body: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                TravelHomeScreen(),
                TravelSearchScreen(),
                TravelBlogScreen(),
                TravelProfileScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}

// appBar: AppBar(
//   automaticallyImplyLeading: false,
//   elevation: 0,
//   titleSpacing: 0,
//   backgroundColor: Colors.transparent,
//   title: Padding(
//     padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//     child: Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         'Welcome homes',
//         style: AppCss.getTextStyle(themeData!.textTheme.headline6!,
//             color: appColor.textPrimary,
//             fontWeight: 700,
//             letterSpacing: 0.5),
//       ),
//     ),
//   ),
//   actions: [
//     Stack(
//       children: [
//         Container(
//           margin: const EdgeInsets.symmetric(
//               horizontal: 10, vertical: 10),
//           width: 36,
//           height: 36,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: appColor.greyOff),
//           child: IconButton(
//               icon: Icon(
//                 MdiIcons.bellOutline,
//                 color: appColor.black,
//                 size: 20,
//               ),
//               onPressed: () {}),
//         ),
//       ],
//     ),
//     SizedBox(width: 5),
//     Padding(
//       padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
//       child: CircleAvatar(
//         backgroundImage: AssetImage(
//           imageAssets.profileImage,
//         ),
//         backgroundColor: Colors.transparent,
//       ),
//     ),
//   ],
// ),
