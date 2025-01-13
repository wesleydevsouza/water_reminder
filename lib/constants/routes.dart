import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:water_reminder/view/home_view.dart';
import 'package:water_reminder/view/intro_view.dart';
import 'package:water_reminder/view/profile_view.dart';
import 'package:water_reminder/view/reminder_config_view.dart';
import 'package:water_reminder/view/slide_view.dart';
import 'package:water_reminder/view/splash_view.dart';
import 'package:water_reminder/view/task_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );

      case '/intro':
        return PageTransition(
          child: const Intro(),
          type: PageTransitionType.rightToLeft,
        );

      case '/slide':
        return PageTransition(
          child: const Slide(),
          type: PageTransitionType.rightToLeft,
        );

      case '/home':
        return PageTransition(
          child: const Home(),
          type: PageTransitionType.rightToLeft,
        );

      case '/reminderconfig':
        return PageTransition(
          child: const ReminderConfig(),
          type: PageTransitionType.fade,
        );

      case '/profile':
        return PageTransition(
          child: const Profile(),
          type: PageTransitionType.rightToLeft,
        );

      case '/task':
        return PageTransition(
          child: Task(),
          type: PageTransitionType.fade,
        );

      default:
        return MaterialPageRoute(builder: (context) => const Splash());
    }
  }
}
