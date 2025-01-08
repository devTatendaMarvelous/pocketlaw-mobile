

import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'AuthResponse.dart';

class AuthModel extends Model {
  String errorMessage = "";

  bool _rememberMe = true;
  bool _stayLoggedIn = true;
  bool _useBio = false;
  // User _user = User(
  //   code: '',
  //   description: '',
  //   loggedInUser: '',
  //   userId: 0,
  //   company: Company(
  //     id: 0,
  //     companyName: '',
  //     externalReference: '',
  //     email: '',
  //     companyRegistrationNumber: '',
  //     telephone: '',
  //     createdAt: null,
  //     updatedAt: null,
  //     type: '',
  //   ),
  // );

  late AuthResponse _user;

  AuthResponse get user => _user;

  List<Map<String, dynamic>> get crimesList {
    return _user.crimes?.map((crime) => {
      'id': crime.id,
      'name': crime.name,
    }).toList() ?? [];
  }

  List<Map<String, dynamic>> get paymentMethods {
    return _user.paymentMethods?.map((payment) => {
      'id': payment.id,
      'name': payment.name,
    }).toList() ?? [];
  }

  List<Map<String, dynamic>> get currencies {
    return _user.currencies?.map((currency) =>{
      'id': currency.id,
      'name': currency.name
    }).toList() ?? [];
  }


  bool get rememberMe => _rememberMe;

  void handleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("remember_me", value);
      prefs.setBool("remember_me_toggle", value);
    });
  }

  bool get isBioSetup => _useBio;

  void handleIsBioSetup(bool value) {
    _useBio = value;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("use_bio", value);
    });
  }

  bool get stayLoggedIn => _stayLoggedIn;

  void handleStayLoggedIn(bool value) {
    _stayLoggedIn = value;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("stay_logged_in", value);
    });
  }

  // void loadSettings() async {
  //   var _prefs = await SharedPreferences.getInstance();
  //   try {
  //     _useBio = _prefs.getBool("use_bio") ?? false;
  //   } catch (e) {
  //     print(e);
  //     _useBio = false;
  //   }
  //   try {
  //     _rememberMe = _prefs.getBool("remember_me") ?? false;
  //   } catch (e) {
  //     print(e);
  //     _rememberMe = false;
  //   }
  //   try {
  //     _stayLoggedIn = _prefs.getBool("stay_logged_in") ?? false;
  //   } catch (e) {
  //     print(e);
  //     _stayLoggedIn = false;
  //   }
  //
  //   if (_stayLoggedIn) {
  //     late AuthResponse _savedUser;
  //     try {
  //       String? _saved = _prefs.getString("vina_user_data");
  //       print("Saved: $_saved");
  //       _savedUser = AuthResponse.fromJson(json.decode(_saved!));
  //     } catch (e) {
  //       print("User Not Found: $e");
  //     }
  //     if (_useBio) {
  //       if (await biometrics()) {
  //         _user = _savedUser;
  //       }
  //     } else {
  //       _user = _savedUser;
  //     }
  //   }
  //   notifyListeners();
  // }

  // Future<bool> biometrics() async {
  //   final LocalAuthentication auth = LocalAuthentication();
  //   bool authenticated = false;
  //   try {
  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Scan to authenticate',
  //       options: const AuthenticationOptions(
  //         useErrorDialogs: true,
  //         stickyAuth: true,
  //       ),
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  //   return authenticated;
  // }

  Future<void> saveUserData(AuthResponse user) async {
    if (user != null) {
      _user = user;
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var _save = json.encode(_user.toJson());
      print("Data: $_save");
      prefs.setString("user_data", _save);
    }
  }

  Future<void> logout() async {
    var _prefs = await SharedPreferences.getInstance();
    _useBio = _prefs.getBool("use_bio")!;
    _rememberMe = _prefs.getBool("remember_me")!;
    print("Logout");
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      //prefs.setString("user_data", null);
    });
    return;
  }
}