import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:water_reminder/constants/images.dart';

final pages = [
  const PageData(
    icon: Icons.bubble_chart,
    title: "Lembre-se de se\nhidratar!",
    bgColor: Color(0xFF0043D0),
    textColor: Colors.white,
  ),
  const PageData(
    imagePath: Images.miku,
    title: "Vou te ajudar\nNessa tarefa!",
    textColor: Colors.white,
    bgColor: Color(0xFFFDBFDD),
  ),
  const PageData(
    icon: Icons.date_range,
    title: "Vamos criar\no primeiro lembrete?",
    bgColor: Color(0xFFFFFFFF),
  ),
];

class Slide extends StatelessWidget {
  const Slide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        colors: pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ),
        itemCount: 3,
        onFinish: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: _Page(page: page),
          );
        },
      ),
    );
  }
}

class PageData {
  final String? title;
  final IconData? icon;
  final String? imagePath;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    this.imagePath,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

class _Page extends StatelessWidget {
  final PageData page;

  const _Page({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    space(double p) => SizedBox(height: screenHeight * p / 100);
    return Column(
      children: [
        space(10),
        _Image(
          page: page,
          size: 190,
          iconSize: 170,
        ),
        space(8),
        _Text(
          page: page,
          style: TextStyle(
            fontSize: screenHeight * 0.046,
          ),
        ),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.page,
    this.style,
  }) : super(key: key);

  final PageData page;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      page.title ?? '',
      style: TextStyle(
        color: page.textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Helvetica',
        letterSpacing: 0.0,
        fontSize: 18,
        height: 1.2,
      ).merge(style),
      textAlign: TextAlign.center,
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.page,
    required this.size,
    required this.iconSize,
  }) : super(key: key);

  final PageData page;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final bgColor = page.bgColor
        .withGreen(page.bgColor.green + 20)
        .withRed(page.bgColor.red - 100)
        .withAlpha(90);

    // Verifica se é um ícone ou uma imagem personalizada
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(60.0)),
        color: bgColor,
      ),
      child: page.icon != null
          ? Icon(
              page.icon,
              size: iconSize,
              color: Colors.white,
            )
          : page.imagePath != null
              ? Image.asset(
                  page.imagePath!,
                  fit: BoxFit.cover,
                )
              : const SizedBox.shrink(), // Caso não tenha nenhum
    );
  }
}
