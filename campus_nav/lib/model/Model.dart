//Save and read data of user preferences
import 'package:shared_preferences/shared_preferences.dart';


class Model{
  List<int> _favourites = [];
  static final String _webSummitImg = 'assets/images/Web_Summit.png';
  static final String _icmlImg = 'assets/images/ICML.png';
  static final String _cesImg = 'assets/images/CES.png';
  static final String _dreamForceImg = 'assets/images/Dreamforce.png';
  static final String _inc5000Img = 'assets/images/inc-5000.png';

  static List _conferencesList = [
    ["Web Summit", "Tech", "10:30", "11:30", "B201", _webSummitImg, ["John", "Lucas"]],
    ["ICML", "Science", "15:00", "17:30", "B314", _icmlImg, ["Lucas"]],
    ["CES", "Tech",  "10:30", "12:30", "B112", _cesImg, ["Lucas"]],
    ["Dreamforce", "Business", "16:30", "18:00", "B207", _dreamForceImg, ["Lucas"]],
    ["Inc. 5000", "Business", "15:30", "17:00", "B003", _inc5000Img, ["Lucas"]],
  ];

  List<int> getFavourites() {
    return _favourites;
  }

  List getConferencesList(){
    return _conferencesList;
  }

  readFavourites(String index) async {
    final favs = await SharedPreferences.getInstance();
    final key = "*fav:$index*";
    final value = favs.getString(key) ?? "0";
    
    if(value == "1") {
      return 1;
    }
    else 
      return 0;
  }

  writeFavourites(String index, String value) async {
    final favs = await SharedPreferences.getInstance();
    final key = "*fav:$index*";
    favs.setString(key, value);
    print('writeFavourites: $value');
  }

}