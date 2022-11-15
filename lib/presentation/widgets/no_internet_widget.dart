import 'package:breaking_bad_mobile_app/utilities/size_config/size_config.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants/colors.dart';
import '../../utilities/constants/strings.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.padding * 1.5,
          ),
          const Text(

            cannotConnectToInternet,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 22,
              color: AppColors.grey,
            ),
          ),
          Image.asset(noInternetImage, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
