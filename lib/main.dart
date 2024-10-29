import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder/constants/routes.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:water_reminder/providers/name_provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NomeProvider(),
        ),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        SizeConfig().init(constraints);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Miku Water Reminder',
          theme: AppTheme.mikuTheme,
          initialRoute: '/splash',
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: navigatorKey,
        );
      }),
    );
  }
}
