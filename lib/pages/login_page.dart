import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pocket_law/constants.dart';
import 'package:pocket_law/generated/assets.dart';
import 'package:pocket_law/routes/routes.dart';
import 'package:pocket_law/widgets/helper.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/AuthResponse.dart';
import '../auth/authModel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  bool passwordVisible = true;
  bool mobileReadonly = false;
  late TextEditingController _controllerMobile;
  late String _mobile, _pin;
  late AuthModel _auth;

  @override
  void initState() {
    _controllerMobile = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _auth = ScopedModel.of<AuthModel>(context, rebuildOnChange: true);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0E21),
              Color(0xFF1D1E33),
            ],
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                            Assets.assetsTraffic,
                          color: Colors.grey,
                        )
                    ),
                    const SizedBox(height: 25),
                    Text("PocketLaw", style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900
                    ),),
                    const SizedBox(height: 50),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildEmailField(),
                          const SizedBox(height: 20),
                          _buildPasswordField(),
                          const SizedBox(height: 30),
                          _buildLoginButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _controllerMobile,
      onSaved: (val) => _mobile = val!,
      readOnly: mobileReadonly,
      decoration: InputDecoration(
        fillColor: Colors.white.withValues(alpha: 0.1),
        filled: true,
        labelText: 'Email',
        labelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        suffixIcon:  Icon(
            Icons.person,
            color:Colors.white.withValues(alpha: 0.6)
        ),
        contentPadding: const EdgeInsets.all(17.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.blue.shade600),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none, // Normal state
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.blue.shade900),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.white),
      validator: (val) {
        if (val!.isEmpty) {
          return "Email cannot be empty";
        } else if (!val.contains('@')) {
          return "Email must contain '@'";
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: passwordVisible,
      onSaved: (val) => _pin = val!,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.1),
        labelText: 'Password',
        labelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            passwordVisible ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            color: Colors.white.withValues(alpha: 0.6),
          ),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
        contentPadding: const EdgeInsets.all(17.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.blue.shade600),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none, // Normal state
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.blue.shade900),
        ),
      ),
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.white),
      validator: (val) {
        if (val!.isEmpty) {
          return "Password cannot be empty";
        } else if (val.length < 4) {
          return "Password length must be at least 4 characters";
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[900],
          padding: const EdgeInsets.symmetric(vertical: 15),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Get.dialog(
        Center(
          child: Container(
            height: 120,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child:  SpinKitFadingCircle(
              color: Colors.blue[900],
              size: 23,
            ),
          ),
        ),
        barrierDismissible: false,
      );

      try {
        var response = await Dio().post(
          "$baseURL/login",
          data: {
            "email": _mobile,
            "password": _pin,
          },
          options: Options(
            headers: {'authorization': ""},
          ),
        );

        Get.back();

        if (response.statusCode == 200) {
          final token = response.data["access_token"];
          await SharedPreferences.getInstance()
              .then((prefs) => prefs.setString('jwt_token', token));

          AuthResponse _newUser = AuthResponse.fromJson(response.data);
          _auth.saveUserData(_newUser);
          Get.toNamed(Routes.dashboard);
        } else {
          showMessageDialog(response.data["message"]);
        }
      } on DioException catch (e) {
        Get.back();
        String errorMsg = "An error occurred";
        if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.unknown) {
          errorMsg = "Network error. Please try again.";
        } else if(e.response?.statusCode == 500){
          showMessageDialog("${e.response!.statusMessage}");
        } else {
          errorMsg = e.response?.data['message'];
          showMessageDialog(errorMsg);
        }

      }
    }
  }

  void _showErrorDialog(String message) {
    Get.dialog(
      Center(
        child: Container(
          height: 120,
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
