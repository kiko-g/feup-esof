//Save and read data of user preferences
import 'package:shared_preferences/shared_preferences.dart';

readFavourites(String index) async {
  final favs = await SharedPreferences.getInstance();
  final key = "*fav:$index*";
  final value = favs.getString(key) ?? "0";
  print('readFavourites: $value');
  return value;
}

writeFavourites(String index, String value) async {
  final favs = await SharedPreferences.getInstance();
  final key = "*fav:$index*";
  favs.setString(key, value);
  print('writeFavourites: $value');
}
