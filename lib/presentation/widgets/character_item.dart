import 'package:breaking_bad_mobile_app/data/models/character_model.dart';
import 'package:breaking_bad_mobile_app/utilities/size_config/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../utilities/constants/colors.dart';
import '../../utilities/constants/strings.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(
          SizeConfig.padding / 2,
          SizeConfig.padding / 2,
          SizeConfig.padding / 2,
          SizeConfig.padding / 2),
      padding: EdgeInsets.all(SizeConfig.padding / 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(SizeConfig.padding / 2),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(characterDetailsScreen, arguments: character);
        },
        child: GridTile(
          footer: Hero(
            tag: character.charId.toString(),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.padding,
                  vertical: SizeConfig.padding / 2),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                '${character.name}',
                style: TextStyle(
                  height: 1.3,
                  fontSize: SizeConfig.titleFontSize,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: AppColors.grey,
            child: character.img != null
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: loadingImage,
                    image: character.img!,
                    imageErrorBuilder: (context, exception, stackTrace) {
                      return Image.asset(
                        personPlaceholderImage,
                        fit: BoxFit.cover,
                      );
                    },
                  )
                : Image.asset(placeholderImage),
          ),
        ),
      ),
    );
  }

  Widget handleError() {
    try {
      return Container(
        color: AppColors.grey,
        child: character.img != null
            ? FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: loadingImage,
                image: character.img!)
            : Image.asset(placeholderImage),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return const SizedBox();
    }
  }
}
