import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import '../../../app_state.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.appState,
    required this.pair,
    required this.icon,
  });

  final MyAppState appState;
  final WordPair pair;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        appState.toggleFavorite(pair);
      },
      icon: Icon(icon),
      label: Text('Like'),
    );
  }
}
