import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:water_reminder/helpers/notification_helper.dart';
import 'package:water_reminder/widgets/top_bar.dart';

class ReminderConfig extends StatefulWidget {
  const ReminderConfig({super.key});

  @override
  State<ReminderConfig> createState() => _ReminderConfigState();
}

class _ReminderConfigState extends State<ReminderConfig> {
  int horas = 1;

  @override
  void initState() {
    super.initState();

    NotificationHelper.init();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: TopBar(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            NotificationHelper.showScheduledNotification(
                              title: 'Miku diz:',
                              body: 'Alex, hora de tomar água',
                              payload: 'Lembrete',
                              repeatInterval: RepeatInterval.hourly,
                            );

                            final snackBar = SnackBar(
                              content: Text(
                                'Agendado para $horas Hora(s)!',
                                style: const TextStyle(fontSize: 24),
                              ),
                              backgroundColor: const Color(0xff38ffe2),
                            );
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          },
                          child: Container(
                            height: SizeConfig.heightMultiplier * 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(300),
                              border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 3),
                            ),
                            child: Image.asset(Images.time1),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 4,
                        ),
                        Container(
                          height: SizeConfig.heightMultiplier * 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(300),
                            border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 3),
                          ),
                          child: Image.asset(
                            Images.time2,
                            height: SizeConfig.heightMultiplier * 8,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 4,
                        ),
                        Container(
                          height: SizeConfig.heightMultiplier * 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(300),
                            border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 3),
                          ),
                          child: Image.asset(
                            Images.time3,
                            height: SizeConfig.heightMultiplier * 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
