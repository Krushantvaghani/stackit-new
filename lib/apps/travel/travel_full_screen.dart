import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackit/apps/travel/routes/route_screen_list.dart';
import 'package:stackit/global/packages/config_package.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/widgets/custom_container.dart';

import '../../widgets/tab_indicator/tab_indicator.dart';

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
    super.initState();
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
              child: CustomContainer(
                color: theme.colorScheme.onPrimary,
                border: Border(
                    top: BorderSide(
                        color: theme.dividerColor,
                        width: 1,
                        style: BorderStyle.solid)),
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: TabBar(
                  controller: _tabController,
                  indicator: FxTabIndicator(
                      indicatorColor: theme.colorScheme.primary,
                      indicatorHeight: 3,
                      radius: 3,
                      indicatorStyle: FxTabIndicatorStyle.rectangle,
                      yOffset: -14),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: theme.colorScheme.primary,
                  tabs: <Widget>[
                    Container(
                      child: (_currentIndex == 0)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  MdiIcons.home,
                                  color: theme.primaryColor,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                    color: theme.primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(2.5),
                                    ),
                                  ),
                                  height: 5,
                                  width: 5,
                                )
                              ],
                            )
                          : Icon(
                              MdiIcons.homeOutline,
                              color: theme.colorScheme.onBackground,
                            ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 0),
                        child: (_currentIndex == 1)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.earth,
                                    color: theme.primaryColor,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(2.5),
                                      ),
                                    ),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.earth,
                                color: theme.colorScheme.onBackground,
                              )),
                    Container(
                        margin: const EdgeInsets.only(left: 0),
                        child: (_currentIndex == 2)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.accountGroup,
                                    color: theme.primaryColor,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(2.5),
                                      ),
                                    ),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.accountGroupOutline,
                                color: theme.colorScheme.onBackground,
                              )),
                    Container(
                      child: (_currentIndex == 3)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  MdiIcons.cog,
                                  color: theme.primaryColor,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                    color: theme.primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(2.5),
                                    ),
                                  ),
                                  height: 5,
                                  width: 5,
                                )
                              ],
                            )
                          : Icon(
                              MdiIcons.cogOutline,
                              color: theme.colorScheme.onBackground,
                            ),
                    ),
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
