import 'package:breaking_bad_mobile_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_mobile_app/data/models/character_model.dart';
import 'package:breaking_bad_mobile_app/data/repository/characters_repository.dart';
import 'package:breaking_bad_mobile_app/utilities/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/web_services/characters_web_services.dart';
import 'presentation/screens/characters_details_screen.dart';
import 'presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (_) {
                  return charactersCubit;
                },
                child: const CharactersScreen(),
              ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => CharactersCubit(charactersRepository),
              child: CharacterDetailsScreen(character: character),
            ),);
    }
  }
}
