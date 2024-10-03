import 'package:flutter/material.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopBar(),
            ],
          ),
        ),
      ),
    );
  }
}
