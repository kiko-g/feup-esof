import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  readFavourites(String index) async {
    final favs = await SharedPreferences.getInstance();
    final key = "*fav:$index*";
    final value = favs.getString(key);
    print('read: $value');
    return value;
  }

  writeFavourites(String index, String value) async {
    final favs = await SharedPreferences.getInstance();
    final key = "*fav:$index*";
    favs.setString(key, value);
    print('saved: $value');
  }
}