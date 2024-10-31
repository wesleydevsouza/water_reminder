import 'package:flutter/material.dart';
import 'package:water_reminder/constants/size_config.dart';
import 'package:water_reminder/constants/styling.dart';

//import 'package:flutter/rendering.dart';

import '../../constants/images.dart';

class Background extends StatelessWidget {
  String image;

  Background({
    Key? key,
    required this.child,
    required this.image,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          child: Image.asset(
            image,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: SizeConfig.screenHeight < 600
                ? BoxFit.fitWidth
                : BoxFit.fitHeight,
            colorBlendMode: BlendMode.dstATop,
          ),
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: child,
        ),
      ],
    );
  }
}
