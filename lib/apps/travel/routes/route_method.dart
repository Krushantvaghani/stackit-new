import 'package:flutter/material.dart';
import 'package:stackit/apps/travel/routes/route_name.dart';
import 'package:stackit/apps/travel/routes/route_screen_list.dart';

class AppRoute {
  static Map<String, WidgetBuilder> getAll() => _getPages;

  static final Map<String, WidgetBuilder> _getPages = {
    RouteName.travelScreen: (context) => const TravelScreen(),
    RouteName.travelDetails: (context) => const TravelDetails(),
    RouteName.travelLogin: (context) => const TravelLoginScreen(),
    RouteName.travelRegister: (context) => const TravelRegisterScreen(),

    // Tab Screen
    RouteName.travelHome: (context) => const TravelHomeScreen(),
    RouteName.travelBlog: (context) => const TravelBlogScreen(),
    RouteName.travelProfile: (context) => const TravelProfileScreen(),
    RouteName.travelSearch: (context) => const TravelSearchScreen(),
  };
}
