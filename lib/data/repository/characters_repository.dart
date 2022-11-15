import 'dart:collection';

import 'package:breaking_bad_mobile_app/data/models/character_model.dart';
import 'package:breaking_bad_mobile_app/data/models/quote.dart';
import 'package:breaking_bad_mobile_app/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((e) => Character.fromJson(e)).toList();
  }

  Future<List<Quote>> getCharQuote(String charName) async {
    final quotes = await charactersWebServices.getCharQuotes(charName);
    return quotes.map((e) => Quote.fromJson(e)).toList();
  }
}
