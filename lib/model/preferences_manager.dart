import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<void> saveFavorite(String favorite) async {
    final SharedPreferences prefs = await _prefs;
    List<String> favoritesPreference = prefs.getStringList('favorites') ?? [];
    favoritesPreference.add(favorite);
    await prefs.setStringList('favorites', favoritesPreference);
  }

  static Future<void> removeFavorite(String favorite) async {
    final SharedPreferences prefs = await _prefs;
    List<String> favoritesPreference = prefs.getStringList('favorites') ?? [];
    favoritesPreference.remove(favorite);
    await prefs.setStringList('favorites', favoritesPreference);
  }

  static Future<List<String>> getFavoritesList() async {
    final SharedPreferences prefs = await _prefs;
    List<String> favoritesPreference = prefs.getStringList('favorites') ?? [];
    return favoritesPreference;
  }
}
