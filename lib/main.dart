import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/preferences_manager.dart';
import 'package:provider/provider.dart';

import 'favorites_page.dart';
import 'generator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  MyAppState() {
    PreferencesManager.getFavorites();
    favorites = Helper.convertToWordPairList(PreferencesManager.favoritesPreference);
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
      PreferencesManager.removeFavorite(current.asCamelCase);
    } else {
      favorites.add(current);
      PreferencesManager.saveFavorite(current.asCamelCase);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}

class Helper {

  static List<WordPair> convertToWordPairList(List<String> stringList) {

    var pairs = <WordPair>[];

    for(var string in stringList) {
      var first = getSubstringsByUpperCase(string).first;
      var last = getSubstringsByUpperCase(string).last;
      pairs.add(WordPair(first, last));
    }
    return pairs;
  }

  static List<String> getSubstringsByUpperCase(String str) {
    int upperCaseIndex =
        str.split('').indexWhere((char) => char == char.toUpperCase());

    String firstSubstring = str.substring(0, upperCaseIndex);
    String secondSubstring = str.substring(upperCaseIndex).toLowerCase();
    return [firstSubstring, secondSubstring];
  }
}