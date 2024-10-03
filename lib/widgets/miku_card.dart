import 'package:flutter/material.dart';
import 'package:water_reminder/constants/styling.dart';

class MikuCard extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String icon;
  final double? height;
  final Function()? onPressed;

  const MikuCard({
    Key? key,
    required this.titulo,
    required this.subtitulo,
    required this.icon,
    this.height,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height ?? MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: AppTheme.corFonte,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: AppTheme.corCard,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      titulo,
                      style: const TextStyle(
                        color: AppTheme.corFonte2,
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
                          color: Colors.black,
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
    );
  }
}
