import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startFadeAnimation();
  }

  void _startFadeAnimation() async {
    setState(() => _opacity = 1.0);
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _opacity = 0.0);
    await Future.delayed(const Duration(seconds: 2));

    handleAsyncTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              colors: [
                Colors.blue.shade600,
                Colors.blue.shade400,
                Colors.blue.shade200,
              ],
              durations: [3000, 4000, 5000],
              heightPercentages: [0.25, 0.35, 0.45],
            ),
            size: const Size(double.infinity, double.infinity),
            waveAmplitude: 25,
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: _opacity,
              child: RichText(
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                text: TextSpan(
                  style: GoogleFonts.righteous(
                      fontSize: 45, color: AppTheme.corLogo2),
                  children: const <TextSpan>[
                    TextSpan(text: 'Miku'),
                    TextSpan(
                      text: 'Water',
                      style: TextStyle(color: AppTheme.corLogo),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> handleAsyncTasks() async {
    if (context.mounted) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/intro', (Route<dynamic> route) => false);
    }
  }
}
