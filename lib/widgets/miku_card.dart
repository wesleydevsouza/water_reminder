//new

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';

class MikuCard extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String icon;
  final Function()? onPressed;

  const MikuCard({
    Key? key,
    required this.titulo,
    required this.subtitulo,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                  right: BorderSide(
                    color: Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppTheme.corScaffold.withOpacity(0.8),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            titulo,
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  offset: const Offset(2, 2),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ],
                              color: AppTheme.corFonte,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              subtitulo,
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                    offset: const Offset(2, 2),
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ],
                                color: AppTheme.corFonte,
                                fontSize: 18.0,
                              ),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
