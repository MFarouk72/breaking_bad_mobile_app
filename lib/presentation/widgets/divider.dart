import 'package:breaking_bad_mobile_app/utilities/size_config/size_config.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  final double endIndent;
  const CustomDivider({Key? key, required this.endIndent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Divider(
      color: AppColors.yellow,
      height: SizeConfig.padding * 2.5,
      endIndent: endIndent,
      thickness: 2,
    );
  }
}
