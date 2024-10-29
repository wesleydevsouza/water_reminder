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

  static const Color corLogo = Color(0xFF38ffe2);
  static const Color corLogo2 = Color(0xFFde1c81);
  static const Color corScaffold = Color(0xFF734acc);
  static const Color corCard = Color(0xFFc6ecfb);
  static const Color corFonte = Colors.white;
  static const Color corFonte2 = Colors.black;

  //Texto
  static const Color corTituloDark = Color(0xFF137a7f);
  static const Color corTituloLight = Color(0xFFF8FCF6);

  //BG
  static const Color corBGIntro1 = Color(0xFF0043D0);
  static const Color corBGIntro2 = Color(0xff38ffe2);
  static const Color corBGIntro3 = Color(0xFFde1c81);

  //Widgets
  static const Color corContainer = Color(0xFFF8FCF6);
  static const Color corBorda = Color(0xff38ffe2);
  static const Color corBordaDisabilitada = Color(0xff52c7ad);

  static final TextStyle titulo = GoogleFonts.josefinSans(
    color: corTituloDark,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );

  static final TextStyle tituloLight = GoogleFonts.josefinSans(
    color: corLogo2,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    fontSize: 20,
  );

  static final TextStyle subTitulo = GoogleFonts.sourceCodePro(
    color: corTituloDark,
    fontWeight: FontWeight.bold,
    fontSize: 26,
  );

  static final TextStyle subTituloLight = GoogleFonts.sourceCodePro(
    color: corFonte,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 2,
  );

  static final TextStyle textoGeral = GoogleFonts.spaceGrotesk(
    color: corTituloDark,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static final TextStyle labelText = GoogleFonts.lexend(
    color: corFonte2,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static final TextTheme lightTextTheme = TextTheme(
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
