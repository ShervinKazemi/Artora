import 'package:artora/core/theme.dart';
import 'package:artora/routes/app_route.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Artora",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: AppRoute.routes,
      initialRoute: AppRoute.welcome,
    );
  }
}