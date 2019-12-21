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
    'B001'    : [[41.177785, -8.595762]],
    'B002'    : [[41.177757, -8.595660]],
    'B003'    : [[41.177692, -8.595586]],
    'B004'    : [[41.177368, -8.595121]],
    'B005'    : [[41.177250, -8.595163]],
    'wc'      : [[41.177383, -8.594701],[41.177564, -8.595611],[41.177764, -8.595037],[41.177730, -8.596451],[41.177798, -8.596765],[41.178283, -8.597865]], 
    'machines' : [[41.177297, -8.595212],[41.177417, -8.595614],[41.177522, -8.595005],[41.177654, -8.595838]],
    'bar' : [[41.178467, -8.597256],[41.177478, -8.594876]]
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
