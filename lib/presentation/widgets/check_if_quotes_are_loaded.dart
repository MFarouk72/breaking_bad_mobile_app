import 'package:breaking_bad_mobile_app/presentation/widgets/show_loading_indicator.dart';
import 'package:flutter/material.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import 'display_random_quote_or_empty_space.dart';

class CheckIfQuotesAreLoaded extends StatelessWidget {
  final CharactersState state;

  const CheckIfQuotesAreLoaded({Key? key, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state is QuotesLoaded) {
      return DisplayRandomQuoteOrEmptySpace(state: state);
    } else {
      return const Center(child: ShowLoadingIndicator());
    }
  }
}
