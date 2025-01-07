import 'dart:ui';

import 'package:flutter/material.dart';
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
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 2.5),
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
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
                          style: const TextStyle(
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
                      const SizedBox(width: 8.0),
                      Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            icon,
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            subtitulo,
                            style: const TextStyle(
                              color: AppTheme.corFonte,
                              fontSize: 18.0,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
