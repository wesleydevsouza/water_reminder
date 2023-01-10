import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'mainscreen.dart';
import 'notification_api.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, String? payload}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GestureDetector(
            //   onTap: () {
            //     NotificationApi().showNotification(1, "title", "body", 10);
            //   },
            //   child: Container(
            //     height: 40,
            //     width: 200,
            //     color: Colors.green,
            //     child: Center(
            //       child: Text("Simple Notification"),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                NotificationApi.showNotification(
                  title: 'Lembrete de Água',
                  body: 'Gatita, toma awa!',
                  payload: 'water.reminder',
                );
              },
              child: Container(
                height: 40,
                width: 200,
                color: Colors.red,
                child: Center(
                  child: Text(
                    "Segunda Notifications",
                  ),
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     NotificationApi().cancelAllNotifications();
            //   },
            //   child: Container(
            //     height: 40,
            //     width: 200,
            //     color: Colors.red,
            //     child: Center(
            //       child: Text(
            //         "Cancel All Notifications",
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
