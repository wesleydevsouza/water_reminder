import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:water_reminder/providers/name_provider.dart';
import 'package:water_reminder/widgets/miku_button.dart';
import 'package:water_reminder/widgets/top_back_button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final nomeProvider = Provider.of<NomeProvider>(context);
    final String nome = nomeProvider.nome ?? '';

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: TopBackButton(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  SizedBox(
                    child: Image.asset(
                      Images.char,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Olá $nome, já bebeu água hoje?",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 3,
                          ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  MikuButton(
                    textButton: 'Alterar Nome',
                    onPressed: () {},
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
