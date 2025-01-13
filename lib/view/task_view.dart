import 'package:flutter/material.dart';
import 'package:water_reminder/constants/background.dart';
import 'package:water_reminder/constants/images.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:water_reminder/widgets/miku_task_card.dart';
import 'package:water_reminder/widgets/top_bar.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double minBlockHeight = screenHeight * 0.2;
    final double maxBlockHeight = screenHeight * 0.8;

    return Background(
      image: Images.bg4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Column(
                children: [
                  const TopBar(),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                ],
              ),
              Positioned(
                bottom: -SizeConfig.heightMultiplier * 8,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy < 0) {
                      setState(() {
                        _isExpanded = true;
                      });
                    } else if (details.delta.dy > 0) {
                      setState(() {
                        _isExpanded = false;
                      });
                    }
                  },
                  onVerticalDragEnd: (details) {},
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: _isExpanded ? maxBlockHeight : minBlockHeight,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Icon(
                                  _isExpanded
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_up,
                                  size: 42,
                                  color: AppTheme.corRealce,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tarefas',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [
                                              AppTheme.corRealce
                                                  .withOpacity(0.3),
                                              AppTheme.corTexto
                                                  .withOpacity(0.1),
                                            ],
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                          ),
                                          border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.add,
                                            color: AppTheme.corRealce,
                                            size:
                                                SizeConfig.heightMultiplier * 5,
                                          ),
                                        ),
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
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  const MikuTaskCard(
                                    titulo: 'titulo',
                                    subtitulo: 'Nome',
                                    icon: Images.bottle,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  const MikuTaskCard(
                                    titulo: 'titulo',
                                    subtitulo: 'Nome',
                                    icon: Images.bottle,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  const MikuTaskCard(
                                    titulo: 'titulo',
                                    subtitulo: 'Nome',
                                    icon: Images.bottle,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  const MikuTaskCard(
                                    titulo: 'titulo',
                                    subtitulo: 'Nome',
                                    icon: Images.bottle,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                  const MikuTaskCard(
                                    titulo: 'titulo',
                                    subtitulo: 'Nome',
                                    icon: Images.bottle,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
