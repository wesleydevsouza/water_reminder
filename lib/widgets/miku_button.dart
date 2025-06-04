import 'package:flutter/material.dart';
import 'package:water_reminder/constants/styling.dart';

import '../../constants/size_config.dart';

class MikuButton extends StatelessWidget {
  final String? textButton;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final BoxShadow? boxShadow;

  const MikuButton({
    Key? key,
    required this.textButton,
    required this.onPressed,
    this.width,
    this.height,
    this.boxShadow,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(minWidth: SizeConfig.widthMultiplier * 85),
        decoration: BoxDecoration(
          boxShadow: boxShadow != null ? [boxShadow!] : null,
          gradient: AppTheme.corBotao,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: MaterialButton(
          height: SizeConfig.heightMultiplier * 6,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          padding: EdgeInsets.zero,
          child: Text(
            textButton!,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.blue.shade900),
          ),
        ),
      ),
    );
  }
}
