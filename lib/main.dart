import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackit/homes/homes_screen.dart';
import 'package:stackit/theme/app_theme.dart';

import 'global/utility/app_notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<AppNotifier>(
      create: (context) => AppNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      // homes: Text('welcome', style: AppCss.getTextStyle(TextStyle()),),
      home: const HomeLayout(),
    );
    // return Consumer<AppNotifier>(
    //   builder: (BuildContext? context, AppNotifier? value, Widget? child) {
    //     return MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData(
    //         primaryColor: appColor.primary,
    //         scaffoldBackgroundColor: appColor.white,
    //       ),
    //       homes: const Index(),
    //     );
    //   },
    // );
  }
}
