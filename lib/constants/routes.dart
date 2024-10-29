import 'package:flutter/material.dart';
import 'package:water_reminder/view/home_view.dart';
import 'package:water_reminder/view/intro_view.dart';
import 'package:water_reminder/view/profile_view.dart';
import 'package:water_reminder/view/reminder_config_view.dart';
import 'package:water_reminder/view/slide_view.dart';
import 'package:water_reminder/view/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );

      case '/intro':
        return MaterialPageRoute(
          builder: (context) => const Intro(),
        );

      case '/home':
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      case '/reminderconfig':
        return MaterialPageRoute(
          builder: (context) => const ReminderConfig(),
        );

      case '/profile':
        return MaterialPageRoute(
          builder: (context) => const Profile(),
        );

      case '/slide':
        return MaterialPageRoute(
          builder: (context) => const Slide(),
        );

      default:
        return MaterialPageRoute(builder: (context) => const Splash());
    }
  }
}
