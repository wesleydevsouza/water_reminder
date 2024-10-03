import 'package:flutter/material.dart';
import 'package:water_reminder/constants/styling.dart';

//import 'package:flutter/rendering.dart';

import '../../constants/images.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppTheme.corScaffold,
          child: Image.asset(
            Images.drink,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
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
