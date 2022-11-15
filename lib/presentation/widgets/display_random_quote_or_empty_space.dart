import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants/colors.dart';

class DisplayRandomQuoteOrEmptySpace extends StatelessWidget {
 final dynamic state;
  const DisplayRandomQuoteOrEmptySpace({Key? key , required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style:
          const TextStyle(fontSize: 20, color: AppColors.white, shadows: [
            Shadow(
              blurRadius: 7,
              color: AppColors.yellow,
              offset: Offset(0, 0),
            )
          ]),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex].quote),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
