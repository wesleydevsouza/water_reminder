import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder/constants/background.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/providers/name_provider.dart';
import 'package:water_reminder/widgets/fade_widget.dart';
import 'package:water_reminder/widgets/miku_button.dart';
import 'package:water_reminder/widgets/miku_snackbar.dart';
import 'package:water_reminder/widgets/miku_textfield.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  late TextEditingController _nomeSolicitadoController;

  @override
  void initState() {
    _nomeSolicitadoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nomeSolicitadoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nomeProvider = Provider.of<NomeProvider>(context);

    return Background(
      image: Images.bg2,
      child: SafeArea(
        child: PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 8,
                  ),
                  FadeWidget(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Text(
                        "Olá, como devo te chamar?",
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MikuTextField(
                      controller: _nomeSolicitadoController,
                      label: "Nome",
                      onChanged: ((value) {
                        setState(() {});
                      }),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight < 600
                        ? SizeConfig.heightMultiplier * 8
                        : SizeConfig.heightMultiplier * 10,
                  ),
                  MikuButton(
                    textButton: 'AVANÇAR',
                    onPressed: () {
                      final nome = _nomeSolicitadoController.text.trim();
                      if (nome.isNotEmpty) {
                        nomeProvider.setConfig(nome);
                        Navigator.pushNamed(context, '/slide');
                      } else {
                        mikuSnackBar(
                          context,
                          title: 'Miku Diz:',
                          message: "Por favor, diga-me como devo te chamar",
                          contentType: ContentType.failure,
                        );
                      }
                    },
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
