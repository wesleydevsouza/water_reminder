import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder/constants/background.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:water_reminder/providers/name_provider.dart';
import 'package:water_reminder/widgets/miku_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Bom dia';
    } else if (hour >= 12 && hour < 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }

  @override
  Widget build(BuildContext context) {
    final nomeProvider = Provider.of<NomeProvider>(context);
    final String nome = nomeProvider.nome ?? '';

    return Background(
      image: Images.bg1,
      child: SafeArea(
        child: PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 24),
                        child: RichText(
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'RobotoSlab',
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontSize: SizeConfig.textMultiplier * 2.8,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: getGreeting(),
                              ),
                              TextSpan(
                                text: '\n$nome',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontSize: SizeConfig.textMultiplier * 3.2,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, right: 16),
                          child: ClipOval(
                            child: Image.asset(
                              Images.neco,
                              height: SizeConfig.heightMultiplier * 8,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 30,
                  ),
                  Column(
                    children: [
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
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
