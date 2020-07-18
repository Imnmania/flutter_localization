import 'package:flutter/material.dart';
import 'package:flutter_localization_app/pages/about_page.dart';
import 'package:flutter_localization_app/pages/settings_page.dart';
import './route_names.dart';
import '../pages/home_page.dart';
import '../pages/not_found_page.dart';

class CustomRouter {


  
  static Route<dynamic> allRoutes(RouteSettings settings){
    switch(settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }

}