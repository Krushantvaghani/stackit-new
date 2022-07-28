import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackit/homes/homes_screen.dart';
import 'package:stackit/theme/app_theme.dart';

import 'utility/app_notifier.dart';

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
      home: const HomeLayout(),
    );
  }
}
