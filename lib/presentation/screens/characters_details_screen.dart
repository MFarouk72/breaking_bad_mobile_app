import 'package:breaking_bad_mobile_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_mobile_app/data/models/character_model.dart';
import 'package:breaking_bad_mobile_app/presentation/widgets/divider.dart';
import 'package:breaking_bad_mobile_app/utilities/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utilities/constants/colors.dart';
import '../../utilities/constants/strings.dart';
import '../widgets/build_silver_appbar.dart';
import '../widgets/character_info.dart';
import '../widgets/check_if_quotes_are_loaded.dart';


class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    BlocProvider.of<CharactersCubit>(context).getCharQuotes(character.name!);
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: CustomScrollView(
        slivers: [
          BuildSilverAppBar(
            character: character,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(SizeConfig.padding,
                      SizeConfig.padding, SizeConfig.padding, 0),
                  padding: EdgeInsets.all(SizeConfig.padding / 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(
                          title: job, value: character.occupation!.join(' / ')),
                      CustomDivider(
                          endIndent: SizeConfig.safeBlockHorizontal * 78),
                      CharacterInfo(
                          title: appearedIn, value: character.category!),
                      CustomDivider(
                          endIndent: SizeConfig.safeBlockHorizontal * 58),
                      CharacterInfo(
                          title: seasons,
                          value: character.appearance!.join(' / ')),
                      CustomDivider(
                          endIndent: SizeConfig.safeBlockHorizontal * 66),
                      CharacterInfo(title: status, value: character.status!),
                      CustomDivider(
                          endIndent: SizeConfig.safeBlockHorizontal * 72),
                      character.betterCallSaulAppearance!.isEmpty
                          ? const SizedBox()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CharacterInfo(
                                    title: betterCallSualSeasons,
                                    value: character.betterCallSaulAppearance!
                                        .join(' / ')),
                                CustomDivider(
                                    endIndent:
                                        SizeConfig.safeBlockHorizontal * 30),
                              ],
                            ),
                      CharacterInfo(
                          title: actorActress, value: character.name!),
                      CustomDivider(
                          endIndent: SizeConfig.safeBlockHorizontal * 50),
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          return CheckIfQuotesAreLoaded(state: state);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 42,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
