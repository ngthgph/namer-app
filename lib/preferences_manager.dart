import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static List<String> _favoritesPreference = List.empty();

  static saveFavorite(String favorite) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.add(favorite);
    await prefs.setStringList('favorites', favorites);

    _favoritesPreference = favorites;
  }

  static void removeFavorite(String favorite) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.remove(favorite);
    await prefs.setStringList('favorites', favorites);

    _favoritesPreference = favorites;
  }

  static void getFavoritesList() async {
    final SharedPreferences prefs = await _prefs;
    final List<String> favorites = prefs.getStringList('favorites') ?? [];

    _favoritesPreference = favorites;
  }

  static List<String> getFavoritesPreference() {
    return _favoritesPreference;
  }
}
