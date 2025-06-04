import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AeroButton extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;
  final Color borderColor;
  final double width;
  final double? height;
  final Function()? onTap;

  const AeroButton({
    super.key,
    this.height,
    required this.width,
    required this.text,
    required this.gradientColors,
    required this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: width,
          height: height ?? 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 2,
                left: 2,
                right: 2,
                height: 24,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.7),
                        Colors.white.withOpacity(0.2),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              // Texto centralizado
              Center(
                child: Text(
                  text,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(
                        blurRadius: 2,
                        color: Colors.black45,
                        offset: Offset(0.5, 0.5),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
