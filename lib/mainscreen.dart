import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:water_reminder/secondpage.dart';
import 'notification_api.dart';
import 'notificationservice.dart';

int horas = 1;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    NotificationApi.init();
    tz.initializeTimeZones();
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SecondPage(payload: payload),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2c0824),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 320,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    NotificationApi.showScheduledNotification(
                      title: 'Miku diz:',
                      body: 'Gatita, toma awa :3',
                      payload: 'Lembrete',
                      scheduledDate: DateTime.now().add(Duration(hours: horas)),
                    );

                    final snackBar = SnackBar(
                      content: Text(
                        'Agendado para ' + horas.toString() + ' Hora(s)!',
                        style: TextStyle(fontSize: 24),
                      ),
                      backgroundColor: Color(0xff38ffe2),
                    );
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: const CircleBorder(),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.3),
                          spreadRadius: 12,
                          blurRadius: 12,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff38ffe2),
                          Color(0xff52c7ad),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Lembre-me de tomar água",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    width: 250,
                    height: 45,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    NotificationApi().cancelAllNotifications();

                    final snackBar = SnackBar(
                      content: Text(
                        'Lembretes limpos!',
                        style: TextStyle(fontSize: 24),
                      ),
                      backgroundColor: Color(0xff25c0a1),
                    );
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: const CircleBorder(),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.3),
                          spreadRadius: 12,
                          blurRadius: 12,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff38ffe2),
                          Color(0xff52c7ad),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Limpar Lembretes",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    width: 250,
                    height: 45,
                  ),
                ),
              ),
              SizedBox(
                height: 245,
              ),
              SizedBox(
                height: 100,
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/tx.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
