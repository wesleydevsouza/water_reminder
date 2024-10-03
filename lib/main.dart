import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_reminder/constants/routes.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        theme: AppTheme.mikuTheme,
        initialRoute: '/home',
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: navigatorKey,
      );
    });
  }
}
