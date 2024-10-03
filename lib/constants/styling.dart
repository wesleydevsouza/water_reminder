import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static LinearGradient corBg = const LinearGradient(colors: [
    Color(0xFF070752),
    Color(0xFF080878),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static LinearGradient corBotao = const LinearGradient(colors: [
    Color(0xff38ffe2),
    Color(0xff52c7ad),
  ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  static const Color corLogo = Color(0xFF359eb3);
  static const Color corLogo2 = Color(0xFFde1c81);
  static const Color corScaffold = Color(0xFF734acc);
  static const Color corCard = Color(0xFFc6ecfb);
  static const Color corFonte = Colors.white;
  static const Color corFonte2 = Colors.black;

  static final TextStyle tituloTopo = GoogleFonts.roboto(
    color: corLogo,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    fontSize: 26,
  );

  static final TextStyle tituloTopo2 = GoogleFonts.pacifico(
    color: corLogo2,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    fontSize: 20,
  );

  static final TextStyle subTitulo = GoogleFonts.poiretOne(
    color: corFonte,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static final TextStyle subTitulo2 = GoogleFonts.poiretOne(
    color: corFonte,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 2,
  );

  static final TextStyle textoGeral = GoogleFonts.roboto(
    color: corFonte,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: tituloTopo,
    displayMedium: tituloTopo2,
    titleMedium: subTitulo,
    titleSmall: subTitulo2,
    bodyLarge: textoGeral,
  );

  static final ThemeData mikuTheme = ThemeData(
    scaffoldBackgroundColor: corScaffold,
    textTheme: lightTextTheme,
  );
}
