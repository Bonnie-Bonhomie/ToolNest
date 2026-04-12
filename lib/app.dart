
import 'package:flutter/material.dart';
import 'package:tool_nest/config/AppRoutes/app_routes.dart';
import 'package:tool_nest/config/AppRoutes/route_name.dart';
import 'package:tool_nest/core/Theme/app_theme.dart';
import 'package:tool_nest/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BAppTheme.light,
      darkTheme: BAppTheme.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: AppRoutes.routes,
    );
  }
}
