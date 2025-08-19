import 'package:artora/presentation/welcome/welcome_page.dart';
import 'package:artora/routes/main_bottom_nav.dart';
import 'package:flutter/cupertino.dart';

class AppRoute {
  static const String home = "/";
  static const String welcome = "/welcome";
  static const String stats = "/stats";

  static final Map<String , WidgetBuilder> routes = {
    home: (ctx) => const MainBottomNav(),
    welcome: (ctx) => const WelcomePage()
  };

}