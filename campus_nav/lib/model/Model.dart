//Save and read data of user preferences
import 'package:campus_nav/view/Screens/SideMenu_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Model{
  List<String> _favourites;
  Settings _settings;
  SideMenu _sideMenu;

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


  Model(){
    _favourites = new List<String>();
    _settings = new Settings();
    _sideMenu = SideMenu();

    readSettings();
    readFavourites();
  }

  List<String> getFavourites() => _favourites;

  List getConferencesList() => _conferencesList;

  //Settings
  getSettings() => _settings;

  getSideMenu() => _sideMenu;

  readFavourites() async {
    //Clear favourites List
    _favourites.clear();

    //Instance SharedPreferences
    final cache = await SharedPreferences.getInstance();

    //Get favourite conferences
    _favourites  = cache.getStringList("fav:") ?? List<String>();
  }

  saveFavourites() async {
    //Instance SharedPreferences
    final cache = await SharedPreferences.getInstance();

    //Save favourite conferences
    cache.setStringList("fav:", _favourites);
  }


  readSettings() async {
    //Instance SharedPreferences
    final cache = await SharedPreferences.getInstance();

    //Get settings
    _settings.darkMode = cache.getBool("darkmode:") ?? false;
  }


  saveSettings() async {
    //Instance SharedPreferences
    final cache = await SharedPreferences.getInstance();

    //Save settings
    cache.setBool("darkmode:", _settings.darkMode);
  }

}

class Settings {
  bool darkMode = false;
}