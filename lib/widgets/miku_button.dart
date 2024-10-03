import 'package:flutter/material.dart';
import 'package:water_reminder/constants/styling.dart';

import '../../constants/size_config.dart';

class MikuButton extends StatelessWidget {
  final String? textButton;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final bool disabled;

  const MikuButton(
      {Key? key,
      required this.textButton,
      required this.onPressed,
      this.disabled = false,
      this.width,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(minWidth: SizeConfig.widthMultiplier * 85),
        decoration: BoxDecoration(
          gradient: AppTheme.corBotao,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: MaterialButton(
          height: SizeConfig.heightMultiplier * 6,
          onPressed: disabled ? null : onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          padding: EdgeInsets.zero,
          child: Text(
            textButton!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
