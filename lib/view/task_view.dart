import 'package:flutter/material.dart';
import 'package:water_reminder/constants/background.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:water_reminder/widgets/miku_card.dart';

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 30,
                    ),
                    MikuCard(
                      titulo: 'Configurar um Lembrete',
                      icon: Images.bottle,
                      onPressed: () {
                        Navigator.pushNamed(context, '/reminderconfig');
                      },
                      height: SizeConfig.heightMultiplier * 14,
                      subtitulo: 'Configure um novo lembrete com intervalos',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
