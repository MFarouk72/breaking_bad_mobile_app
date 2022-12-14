import 'package:bloc/bloc.dart';
import 'package:breaking_bad_mobile_app/data/models/character_model.dart';
import 'package:breaking_bad_mobile_app/data/models/quote.dart';
import 'package:breaking_bad_mobile_app/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getCharQuotes(String charName) {
    charactersRepository.getCharQuote(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }

}
