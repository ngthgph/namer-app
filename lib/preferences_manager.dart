import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static List<String> favoritesPreference = List.empty();

  static void saveFavorite(String favorite) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.add(favorite);
    await prefs.setStringList('favorites', favorites);

    favoritesPreference = favorites;
  }

  static void removeFavorite(String favorite) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.remove(favorite);
    await prefs.setStringList('favorites', favorites);

    favoritesPreference = favorites;
  }

  static void getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];

    favoritesPreference = favorites;
  }
}
