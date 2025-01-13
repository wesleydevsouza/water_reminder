import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/constants/size_config.dart';

class AppTheme {
  static LinearGradient corBg = const LinearGradient(colors: [
    Color(0xFF070752),
    Color(0xFF080878),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static LinearGradient corBotao = const LinearGradient(colors: [
    Color(0xff38ffe2),
    Color(0xff52c7ad),
  ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  static const Color corScaffold = Color(0xFF734acc);
  static const Color corCard = Color(0xFFc6ecfb);
  static const Color corFonte = Colors.white;
  static const Color corFonte2 = Colors.black;

  //Texto
  static const Color corTituloDark = Color(0xFF137a7f);
  static const Color corTituloLight = Color(0xFFF8FCF6);
  static const Color corLogo = Color(0xFF38ffe2);
  static const Color corLogo2 = Color(0xFFe12885);

  //BG
  static const Color corBGIntro1 = Color(0xFF0043D0);
  static const Color corBGIntro2 = Color(0xFF31e6f0);
  static const Color corBGIntro3 = Color(0xFFe12885);

  //Widgets
  static const Color corContainer = Color(0xFFF8FCF6);
  static const Color corBorda = Color(0xff38ffe2);
  static const Color corBordaDisabilitada = Color(0xff52c7ad);

  //Rewards
  static const Color corRealce = Color(0xffAD49E1);
  static const Color corBackground = Color(0xff2E073F);
  static const Color corTexto = Color(0xff7A1CAC);
  static const Color corIcone = Color(0xffEBD3F8);

  static const TextStyle titulo = TextStyle(
    fontFamily: 'JosefinSans',
    color: corTituloDark,
    fontWeight: FontWeight.w900,
    fontSize: 32,
  );

  static const TextStyle tituloLight = TextStyle(
    fontFamily: 'JosefinSans',
    color: corLogo2,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    fontSize: 20,
  );

  static const TextStyle subTitulo = TextStyle(
    fontFamily: 'SourceCode',
    color: corTituloDark,
    fontWeight: FontWeight.bold,
    fontSize: 26,
  );

  static const TextStyle subTituloLight = TextStyle(
    fontFamily: 'SourceCode',
    color: corFonte,
    fontWeight: FontWeight.bold,
    fontSize: 26,
  );

  static const TextStyle textoGeral = TextStyle(
    fontFamily: 'SpaceGrotesk',
    color: corTituloDark,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle labelText = TextStyle(
    fontFamily: 'Frutiger',
    color: corFonte,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );

  static const TextTheme lightTextTheme = TextTheme(
    titleLarge: titulo, // Title
    titleMedium: tituloLight,
    displayLarge: subTitulo, // Sub-title
    displayMedium: subTituloLight,
    bodyLarge: textoGeral, // Body
    labelLarge: labelText, // Label
  );

  static final ThemeData mikuTheme = ThemeData(
    scaffoldBackgroundColor: corScaffold,
    textTheme: lightTextTheme,
  );
}
