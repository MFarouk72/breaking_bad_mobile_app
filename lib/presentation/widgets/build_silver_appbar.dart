import 'package:breaking_bad_mobile_app/data/models/character_model.dart';
import 'package:breaking_bad_mobile_app/utilities/size_config/size_config.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants/colors.dart';
import '../../utilities/constants/strings.dart';

class BuildSilverAppBar extends StatelessWidget {
  final Character character;
  const BuildSilverAppBar({Key? key , required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SliverAppBar(
      expandedHeight: SizeConfig.blockSizeVertical * 85,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickname!,
          style: const TextStyle(color: AppColors.white),
        ),
        background: Hero(
          tag: character.charId.toString(),
          child: Image.network(
            character.img!,
            fit: BoxFit.cover,
            errorBuilder: (context, exception,stackTrace) {
              return Image.asset(personPlaceholderImage, fit: BoxFit.cover,);
            },
          ),
        ),
      ),
    );
  }
}
