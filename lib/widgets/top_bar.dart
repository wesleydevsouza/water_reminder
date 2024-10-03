import 'package:flutter/material.dart';
import 'package:water_reminder/constants/size_config.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10, top: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: SizeConfig.heightMultiplier * 6,
            ),
          ),
        ),
      ],
    );
  }
}
