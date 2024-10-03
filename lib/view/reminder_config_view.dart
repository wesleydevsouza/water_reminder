import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:water_reminder/widgets/top_bar.dart';

class ReminderConfig extends StatefulWidget {
  const ReminderConfig({super.key});

  @override
  State<ReminderConfig> createState() => _ReminderConfigState();
}

class _ReminderConfigState extends State<ReminderConfig> {
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
                            Images.time1,
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
