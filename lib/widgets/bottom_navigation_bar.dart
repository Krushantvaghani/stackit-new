import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackit/assets/image_assets.dart';
import 'package:stackit/assets/index.dart';
import 'package:stackit/utility/app_notifier.dart';
import 'package:stackit/utility/screen_media.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';

class BottomNavigationBar extends StatefulWidget {
  final List<IconData>? icons;
  final List<IconData>? activeIcons;
  final List<Widget>? screens;
  final List<String>? titles;
  final Color? activeColor, color, navigationBackground;
  final int? initialIndex;
  final double? activeIconSize, iconSize;
  final Widget? backButton;
  final Color? splashColor, highlightColor;

  const BottomNavigationBar({
    Key? key,
    @required this.icons,
    this.activeIcons,
    this.screens,
    this.titles,
    this.activeColor,
    this.color,
    this.navigationBackground,
    this.initialIndex,
    this.activeIconSize,
    this.iconSize,
    this.backButton,
    this.splashColor,
    this.highlightColor,
  }) : super(key: key);

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar>
    with SingleTickerProviderStateMixin {
  ThemeData? themeData;

  //Final Variables
  late List<IconData> icons;
  late List<IconData> activeIcons;
  late List<Widget> screens;
  late List<String> titles;
  late Color activeColor,
      color,
      navigationBackground,
      splashColor,
      highlightColor;
  late int length, initialIndex;
  late double activeIconSize, iconSize;
  late Widget backButton;

  //
  int _currentIndex = 0;
  late TabController _tabController;

  late ValueNotifier<bool> _isExtended;

  _handleTabSelection() {
    changeTab(_tabController.index);
  }

  onTapped(value) {
    changeTab(value);
  }

  dispose() {
    super.dispose();
    _tabController.dispose();
  }

  changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.index = index;
    });
  }

  @override
  void initState() {
    super.initState();

    //Final Variables
    icons = widget.icons!;
    activeIcons = widget.activeIcons ?? icons;
    screens = widget.screens!;
    titles = widget.titles!;
    activeColor = widget.activeColor!;
    splashColor = widget.splashColor!;
    highlightColor = widget.highlightColor!;
    color = widget.color!;
    length = icons.length;
    initialIndex = widget.initialIndex ?? 0;
    iconSize = widget.iconSize ?? widget.activeIconSize ?? 24;
    activeIconSize = widget.activeIconSize ?? widget.iconSize ?? 24;
    backButton = widget.backButton!;
    navigationBackground = widget.navigationBackground!;
    _currentIndex = initialIndex;

    //Mobile Tab Controller
    _tabController = new TabController(
        length: length, vsync: this, initialIndex: initialIndex);
    _tabController.addListener(_handleTabSelection!);
    _tabController.animation!.addListener(() {
      final aniValue = _tabController.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier?>(
      builder: (BuildContext context, AppNotifier? value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value!.themeMode()),
          home: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (ScreenMedia.isMinimumSize(ScreenMediaType.XS,
                  currentWidth: constraints.maxWidth)) {
                return Container();
              }
              return Container();
            },
          ),
        );
      },
    );
  }

  Widget mobileScreen() {
    List<Widget> tabs = [];

    for (int i = 0; i < length; i++) {
      tabs.add(Container(
        child: _currentIndex == i
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    activeIcons[i],
                    color: activeColor ?? themeData!.colorScheme.primary,
                    size: activeIconSize,
                  ),
                  titles != null
                      ? Text(
                          titles[i],
                          style: AppCss.getTextStyle(
                              themeData!.textTheme.caption!,
                              color:
                                  activeColor ?? themeData!.colorScheme.primary,
                              fontWeight: 600),
                        )
                      : SizedBox()
                ],
              )
            : Icon(
                icons[i],
                color: color ?? themeData!.colorScheme.onBackground,
                size: iconSize,
              ),
      ));
    }

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          shape: CircularNotchedRectangle(),
          child: Container(
            decoration: BoxDecoration(
              color: navigationBackground ?? themeData!.bottomAppBarTheme.color,
            ),
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: themeData!.colorScheme.primary,
              tabs: tabs,
            ),
          )),
      body: TabBarView(
        controller: _tabController,
        children: screens,
      ),
    );
  }
}

class _NavigationRailHeader extends StatelessWidget {
  const _NavigationRailHeader({
    required this.extended,
  }) : assert(extended != null);

  final ValueNotifier<bool> extended;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final animation = NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Align(
          alignment: AlignmentDirectional.centerStart,
          widthFactor: animation.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    InkWell(
                      key: const ValueKey('ReplyLogo'),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Row(
                        children: [
                          Transform.rotate(
                            angle: animation.value * pi,
                            child: const Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          SizedBox(width: 15),
                          Image(
                            image: AssetImage(ImageAssets().brand),
                            width: 24,
                          ),
                          SizedBox(width: 15),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            widthFactor: animation.value,
                            child: Opacity(
                              opacity: animation.value,
                              child: Text(
                                'FLUTKIT',
                                style: AppCss.getTextStyle(
                                    themeData!.textTheme.bodyText1!,
                                    fontWeight: 700,
                                    color: Colors.white,
                                    letterSpacing: 0.4),
                              ),
                            ),
                          ),
                          SizedBox(width: 18 * animation.value),
                        ],
                      ),
                      splashColor: Colors.white24,
                      highlightColor: Colors.white24,
                      onTap: () {
                        extended.value = !extended.value;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
