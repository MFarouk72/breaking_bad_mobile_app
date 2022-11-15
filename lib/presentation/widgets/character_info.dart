import 'package:breaking_bad_mobile_app/utilities/size_config/size_config.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants/colors.dart';

class CharacterInfo extends StatelessWidget {
  final String title;
  final String value;
  const CharacterInfo({Key? key, required this.title , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.titleFontSize *1.2,
          ),
        ),
        TextSpan(
          text: value,
          style:  TextStyle(
            color: AppColors.white,
            fontSize: SizeConfig.textFontSize * 1.3,
          ),
        ),
      ]),
    );
  }
}
