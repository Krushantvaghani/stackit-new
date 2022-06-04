import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stackit/utility/app_notifier.dart';
import 'package:stackit/homes/home_screen_list.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayout createState() => _HomeLayout();
}

class _HomeLayout extends State<HomeLayout> {
  dynamic _selectedPage = 0;
  late ThemeData theme;

  final List<Widget> fragmentView = [
    const HomeScreenList(),
  ];
  final List<String> fragmentTitle = ['Material Apps', 'Custom Apps'];

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier?>(
      builder: (BuildContext context, AppNotifier? value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            key: _drawerKey,
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  MdiIcons.menu,
                  color: theme.colorScheme.onBackground,
                ),
                onPressed: () {
                  _drawerKey.currentState!.openDrawer();
                },
              ),
              title: Text(
                fragmentTitle[_selectedPage],
                style: AppCss.getTextStyle(
                  theme.textTheme.headline6!,
                  fontWeight: 600,
                ),
              ),
              backgroundColor: theme.backgroundColor,
            ),
            body: fragmentView[_selectedPage],
            drawer: Drawer(
                child: Container(
              color: theme.scaffoldBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SafeArea(
                    child: Container(
                      color: theme.scaffoldBackgroundColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Image(
                            image:
                                AssetImage('assets/images/brand/flutter.png'),
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withAlpha(40),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: Text(
                              'Version 1.0',
                              style: TextStyle(
                                fontSize: 16,
                                color: theme.colorScheme.primary,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    /*flex: 5,*/
                    child: Container(
                      color: theme.scaffoldBackgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: const EdgeInsets.only(left: 16, top: 16),
                              child: Text(
                                "APPS",
                                style: AppCss.getTextStyle(
                                  theme.textTheme.headline6!,
                                  fontWeight: 600,
                                  color: theme.primaryColor,
                                ),
                                // style: TextStyle(
                                //   color: theme.colorScheme.primary,
                                //   letterSpacing: 0,
                                //   fontSize: 18,
                                // ),
                              )),
                          ListTile(
                            leading: Icon(
                              MdiIcons.viewCarouselOutline,
                              color: _selectedPage == 0
                                  ? theme.primaryColor
                                  : theme.colorScheme.onBackground,
                              size: 24,
                            ),
                            title: Text(
                              "Material",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: _selectedPage == 0
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                                color: _selectedPage == 0
                                    ? theme.primaryColor
                                    : theme.colorScheme.onBackground,
                              ),
                            ),
                            onTap: () {
                              setState(
                                () {
                                  _selectedPage = 0;
                                  _drawerKey.currentState!.openEndDrawer();
                                },
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              MdiIcons.phoneOutline,
                              color: _selectedPage == 1
                                  ? theme.primaryColor
                                  : theme.colorScheme.onBackground,
                              size: 24,
                            ),
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Custom",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: _selectedPage == 1
                                        ? FontWeight.w700
                                        : FontWeight.w600,
                                    color: _selectedPage == 1
                                        ? theme.primaryColor
                                        : theme.colorScheme.onBackground,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 4, 12, 4),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.background,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    border: Border.all(
                                      width: 1.5,
                                      color: theme.primaryColor,
                                    ),
                                  ),
                                  child: Text(
                                    "Coming Soon",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: theme.primaryColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              setState(
                                () {
                                  _selectedPage == 1;
                                  _drawerKey.currentState!.openEndDrawer();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
