import 'package:campus_nav/model/Model.dart';

class Controller {
  Model _model;

  Controller(){
    _model = new Model();
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
  readFavourites() => _model.readFavourites();

  saveFavourites() => _model.saveFavourites();

  void addFavourite(String name) => _model.getFavourites().add(name);

  void removeFavourite(String name){
    List<String> favourites = _model.getFavourites();
    favourites.removeWhere((item) => item == name);
  } 

  bool checkFavourite(String name) => _model.getFavourites().indexOf(name)!=-1?true:false;

  //Settings Functions
  getSettings() => _model.getSettings();

  readSettings() => _model.readSettings();

  saveSettings() => _model.saveSettings();

}