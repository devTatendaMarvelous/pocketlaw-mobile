

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

  AuthResponse? _user;

  AuthResponse? get user => _user;

  List<Map<String, dynamic>> get crimesList {
    return _user?.crimes?.map((crime) => {
      'id': crime.id,
      'name': crime.name,
    }).toList() ?? [];
  }

  List<Map<String, dynamic>> get paymentMethods {
    return _user?.paymentMethods?.map((payment) => {
      'id': payment.id,
      'name': payment.name,
    }).toList() ?? [];
  }

  List<Map<String, dynamic>> get currencies {
    return _user?.currencies?.map((currency) =>{
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

  Future<void> saveLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    print("------------------saving data");
  }

  Future<void> saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_user != null) {
      String userJson = json.encode(_user!.toJson());
      await prefs.setString('user_data', userJson);
    }
  }

  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user_data');
    if (userJson != null) {
      _user = AuthResponse.fromJson(json.decode(userJson));
      notifyListeners(); // Notify listeners to rebuild dependent widgets
    }
  }

  void setUser(AuthResponse user) {
    _user = user;
    notifyListeners(); // Update UI components relying on this data
    saveUser(); // Persist the changes immediately
  }

  // Call this when logging out
  Future<void> clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
    _user = null;
    notifyListeners();
  }


}