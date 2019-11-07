//Side Menu
import 'package:campus_nav/view/Screens/SideMenu_screen.dart';


class Model{
  List<String> _favourites;
  Settings _settings;
  SideMenu _sideMenu;
  Profile _profile;

  static final String _webSummitImg = 'assets/images/Web_Summit.png';
  static final String _icmlImg = 'assets/images/ICML.png';
  static final String _cesImg = 'assets/images/CES.png';
  static final String _dreamForceImg = 'assets/images/Dreamforce.png';
  static final String _inc5000Img = 'assets/images/inc-5000.png';

  static List _conferencesList = [
    ['Web Summit', 'Tech', '10:30', '11:30', 'B201', _webSummitImg, ['John', 'Lucas']],
    ['ICML', 'Science', '15:00', '17:30', 'B314', _icmlImg, ['Lucas']],
    ['CES', 'Tech',  '10:30', '12:30', 'B112', _cesImg, ['Lucas']],
    ['Dreamforce', 'Business', '16:30', '18:00', 'B207', _dreamForceImg, ['Lucas']],
    ['Inc. 5000', 'Business', '15:30', '17:00', 'B003', _inc5000Img, ['Lucas']],
  ];


  Model(){
    _favourites = List<String>();
    _settings = Settings();
    _profile = Profile();
    _sideMenu = SideMenu();
  }

  List<String> getFavourites() => _favourites;

  List getConferencesList() => _conferencesList;

  //Settings
  getSettings() => _settings;

  getSideMenu() => _sideMenu;

  getProfile() => _profile;

}

class Settings {
  bool darkMode = false;
}

class Profile {
  String name, image;
  bool isMale, sports, science, tech, softw, business;
}