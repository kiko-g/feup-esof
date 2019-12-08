//Side Menu
import 'package:campus_nav/view/Screens/SideMenu_screen.dart';

class Model {
  List<String> _favourites;
  Settings _settings;
  SideMenu _sideMenu;
  Profile _profile;

  String hasDestination = 'false';

  static final String _webSummitImg = 'assets/images/Web_Summit.png';
  static final String _icmlImg = 'assets/images/ICML.png';
  static final String _cesImg = 'assets/images/CES.png';
  static final String _dreamForceImg = 'assets/images/Dreamforce.png';
  static final String _inc5000Img = 'assets/images/inc-5000.png';

  static List _conferencesList = [
    [
      'Web Summit',
      'Tech',
      '10:30',
      '11:30',
      'B001',
      _webSummitImg,
      ['John', 'Lucas']
    ],
    [
      'ICML',
      'Science',
      '15:00',
      '17:30',
      'B002',
      _icmlImg,
      ['Lucas']
    ],
    [
      'CES',
      'Tech',
      '10:30',
      '12:30',
      'B003',
      _cesImg,
      ['Lucas']
    ],
    [
      'Dreamforce',
      'Business',
      '16:30',
      '18:00',
      'B004',
      _dreamForceImg,
      ['Lucas']
    ],
    [
      'Inc. 5000',
      'Business',
      '15:30',
      '17:00',
      'B005',
      _inc5000Img,
      ['Lucas']
    ],
  ];

  static Map _locations = {
    'B001'    : [[41.177831, -8.595771]],
    'B002'    : [[41.177773, -8.595635]],
    'B003'    : [[41.177714, -8.595541]],
    'B004'    : [[41.177368, -8.595121]],
    'B005'    : [[41.177250, -8.595163]],
    'wc'      : [[41.177831, -8.595771],[41.177773, -8.595635]], //estao mal, so meti para testar
    'machine' : [[41.177831, -8.595771],[41.177714, -8.595541]], //estao mal, so meti para testar
    'coffee'  : [[41.177368, -8.595121]] //estao mal, so meti para testar
  };

  Model() {
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

  getDestinations() => _locations;

  getHasDestination() => hasDestination;

  removeHasDestination() => hasDestination = 'false';

  addHasDestination(String nome) => hasDestination = nome;
}

class Settings {
  bool darkMode = false;
}

class Profile {
  String name = 'User', image = 'assets/images/profileDefault.png';
  bool isMale = true,
      sports = false,
      science = false,
      tech = false,
      softw = false,
      business = false;
}
