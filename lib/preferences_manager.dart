import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static void saveFavorite(String favorite) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.add(favorite);
    await prefs.setStringList('favorites', favorites);
  }

  static void removeFavorite(String favorite) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.remove(favorite);
    await prefs.setStringList('favorites', favorites);
  }
}
