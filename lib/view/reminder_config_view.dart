import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:water_reminder/helpers/notification_helper.dart';
import 'package:water_reminder/widgets/miku_button.dart';
import 'package:water_reminder/widgets/top_bar.dart';

class ReminderConfig extends StatefulWidget {
  const ReminderConfig({super.key});

  @override
  State<ReminderConfig> createState() => _ReminderConfigState();
}

class _ReminderConfigState extends State<ReminderConfig> {
  int horas = 1;
  TimeOfDay selectedTime = TimeOfDay.now();

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //7h - 22h
                        GestureDetector(
                          onTap: () {
                            const int startHour = 7;
                            const int endHour = 22;

                            NotificationHelper.showScheduledNotification(
                              title: 'Miku diz:',
                              body: 'Alex, hora de tomar água 🥤💧',
                              payload: 'Lembrete',
                              repeatInterval: RepeatInterval.hourly,
                              startHour: startHour,
                              endHour: endHour,
                            );

                            const snackBar = SnackBar(
                              content: Text(
                                'Agendado para $startHour:00 às $endHour:00!',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                              backgroundColor: Color(0xff38ffe2),
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
                        //12h - 2h
                        GestureDetector(
                          onTap: () {
                            const int startHour = 12;
                            const int endHour = 2;

                            NotificationHelper.showScheduledNotification(
                              title: 'Miku diz:',
                              body: 'Alex, hora de tomar água 🥤💧',
                              payload: 'Lembrete',
                              repeatInterval: RepeatInterval.hourly,
                              startHour: startHour,
                              endHour: endHour,
                            );

                            const snackBar = SnackBar(
                              content: Text(
                                'Agendado para $startHour:00 às $endHour:00!',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                              backgroundColor: Color(0xff38ffe2),
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
                            child: Image.asset(
                              Images.time2,
                              height: SizeConfig.heightMultiplier * 8,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 4,
                        ),
                        //Custom
                        GestureDetector(
                          onTap: (() async {
                            final TimeOfDay? timeOfDay = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                                initialEntryMode: TimePickerEntryMode.input);
                            if (timeOfDay != null) {
                              setState(() {
                                selectedTime = timeOfDay;
                              });
                            }
                          }),
                          child: Container(
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
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 3,
                        ),
                        MikuButton(
                          textButton: 'Limpar Lembretes',
                          onPressed: () {
                            NotificationHelper().cancelAllNotifications();

                            const snackBar = SnackBar(
                              content: Text(
                                'Lembretes limpos!',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                              backgroundColor: Color(0xff25c0a1),
                            );
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          },
                        )
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
