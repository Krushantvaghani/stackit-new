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

  @override
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
              shape: const CircularNotchedRectangle(),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.onBackground,
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary,
                      offset: const Offset(0, -3),
                    )
                  ],
                ),
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: TabBar(
                  controller: _tabController,
                  indicator: const BoxDecoration(),
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
                                  margin: const EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(2.5))),
                                  height: 5,
                                  width: 5,
                                )
                              ],
                            )
                          : Icon(
                              MdiIcons.storeOutline,
                              color: theme.backgroundColor,
                            ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 0),
                        child: (_currentIndex == 1)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.magnify,
                                    color: theme.primaryColor,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: const BorderRadius.all(
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
                        margin: const EdgeInsets.only(left: 0),
                        child: (_currentIndex == 2)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.tag,
                                    color: theme.primaryColor,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: const BorderRadius.all(
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
                                        borderRadius: const BorderRadius.all(
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
