import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/providers/name_provider.dart';
import 'package:water_reminder/widgets/miku_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final nomeProvider = Provider.of<NomeProvider>(context);
    final String nome = nomeProvider.nome ?? '';

    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Olá $nome, lembre-se de beber 2L de água por dia",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 3,
                          ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                Image.asset(
                  Images.drink,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  colorBlendMode: BlendMode.dstATop,
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
    );
  }
}
