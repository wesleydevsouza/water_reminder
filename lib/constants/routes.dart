// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:water_reminder/view/home.dart';
import 'package:water_reminder/view/mainscreen.dart';
import 'package:water_reminder/view/profile_view.dart';
import 'package:water_reminder/view/reminder_config_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/intro':
        return MaterialPageRoute(
          builder: (context) => Home(),
        );

      case '/reminderconfig':
        return MaterialPageRoute(
          builder: (context) => ReminderConfig(),
        );

      case '/profile':
        return MaterialPageRoute(
          builder: (context) => Profile(),
        );

      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}
