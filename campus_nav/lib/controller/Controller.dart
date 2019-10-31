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

  void addFavourite(int index){
    _model.getFavourites().add(index);
  }

  List getConferences(){
    return _model.getConferencesList();
  }

  readFavourites(String index){
    return _model.readFavourites(index);
  }

  writeFavourites(String index, String value){
    _model.writeFavourites(index, value);
  }

  bool checkFavourite(String index) {
    String fav = this.readFavourites(index);
    print(fav);
    
    if(fav == "1")
      return true;
    else
      return false;
  }

}