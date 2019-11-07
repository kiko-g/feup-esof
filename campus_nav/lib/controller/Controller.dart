//Model
import 'package:campus_nav/model/Model.dart';
//Shared Preferences
import 'package:shared_preferences/shared_preferences.dart';

class Controller {
  Model _model;

  Controller(){
    _model = new Model();

    readSettings();
    readFavourites();
    readProfile();
  }

  static Controller _instance;

  static Controller instance (){
    if(_instance == null)
      _instance = new Controller();

    return _instance;
  }

  //Side Menu
  getSideMenu() => _model.getSideMenu(); 

  //Conferences Functions
  List getConferences() => _model.getConferencesList();

  //Favourites Functions
  readFavourites() async {
    //Clear favourites List
    List favourites = _model.getFavourites();

    favourites.clear();

    //Instance SharedPreferences
    final cache = await SharedPreferences.getInstance();

    //Get favourite conferences
     favourites = cache.getStringList('fav:') ?? List<String>();
  }

  saveFavourites() async {
    //Instance SharedPreferences
    final cache = await SharedPreferences.getInstance();

    //Save favourite conferences
    cache.setStringList('fav:', _model.getFavourites());
  }

  void addFavourite(String name) => _model.getFavourites().add(name);

  void removeFavourite(String name){
    List<String> favourites = _model.getFavourites();
    favourites.removeWhere((item) => item == name);
  } 

  bool checkFavourite(String name) => _model.getFavourites().indexOf(name)!=-1?true:false;

  //Settings Functions
  getSettings() => _model.getSettings();

  readSettings() async {
    //Instance SharedPreferences
    final cache = await SharedPreferences.getInstance();

    //Get settings
    _model.getSettings().darkMode = cache.getBool('darkmode:') ?? false;
  }

  saveSettings() async {
    //Instance SharedPreferences
    final cache = await SharedPreferences.getInstance();
    
    //Save settings
    cache.setBool('darkmode:', _model.getSettings().darkMode);
  }

  //Profile Functions
  getProfile() => _model.getProfile();

  readProfile() async {
    Profile profile = _model.getProfile();
    //Instance SharedPreferences
    final cache = await SharedPreferences.getInstance();

    //Read profile
    profile.name = cache.getString('name:') ?? 'User';
    profile.isMale = cache.getBool('isMale:') ?? false;
    profile.image = cache.getString('image:') ?? 'assets/images/profileDefault.png';
    //Read profile interests
    profile.science = cache.getBool('science:') ?? false;
    profile.tech = cache.getBool('tech:') ?? false;
    profile.sports = cache.getBool('sports:') ?? false;
    profile.softw = cache.getBool('softw:') ?? false;
    profile.business = cache.getBool('business:') ?? false;

  }
  
  saveProfile() async {
    Profile profile = _model.getProfile();
    //Instance SharedPreferences
    final cache = await SharedPreferences.getInstance();

    //Save profile settings
    cache.setString('name:', profile.name);
    cache.setBool('isMale:', profile.isMale);
    cache.setString('image:', profile.image);
    //Save profile interests
    cache.setBool('sports:', profile.sports);
    cache.setBool('science:', profile.science);
    cache.setBool('tech:', profile.tech);
    cache.setBool('sports:', profile.sports);
    cache.setBool('softw:', profile.softw);
  }

}