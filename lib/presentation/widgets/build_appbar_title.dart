import 'package:breaking_bad_mobile_app/utilities/size_config/size_config.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants/colors.dart';

class BuildAppBarTitle extends StatelessWidget {
  final String title;
  const BuildAppBarTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      title,
      style: TextStyle(color: AppColors.grey, fontSize: SizeConfig.titleFontSize),
    );
  }
}
