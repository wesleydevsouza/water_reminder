import 'package:flutter/material.dart';
import 'package:water_reminder/constants/background.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:water_reminder/widgets/miku_task_card.dart';
import 'package:water_reminder/widgets/top_bar.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      image: Images.bg4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                TopBar(),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 30,
                      ),
                      MikuTaskCard(
                        titulo: 'Type',
                        icon: Images.bottle,
                        onPressed: () {
                          Navigator.pushNamed(context, '/reminderconfig');
                        },
                        subtitulo: 'Description',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
