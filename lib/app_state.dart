import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/model/converter.dart';
import 'package:namer_app/model/preferences_manager.dart';

class MyAppState extends ChangeNotifier {

  MyAppState() {
    getFavoritesPreference();
  }

  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  // Get the favoritesPreference
  void getFavoritesPreference() async {
    var tempList = await PreferencesManager.getFavoritesList();
    favorites = StringToPairConverter.convertToWordPairList(tempList);
    notifyListeners();
  }

  void toggleFavorite(pair) {
    if (favorites.contains(pair)) {
      favorites.remove(pair);
      PreferencesManager.removeFavorite(pair.asCamelCase);
    } else {
      favorites.add(pair);
      PreferencesManager.saveFavorite(pair.asCamelCase);
    }
    notifyListeners();
  }
}
