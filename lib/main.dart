import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_law/pages/start_page.dart';
import 'package:pocket_law/routes/routes.dart';
import 'package:pocket_law/ssl.dart';
import 'package:scoped_model/scoped_model.dart';

import 'auth/authModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = CustomHttpOverrides();
  AuthModel authModel = AuthModel();
  await authModel.loadUser();
  runApp( ScopedModel<AuthModel>(
    model: authModel,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PocketLaw',
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey.shade900),
          useMaterial3: true,
        ),
        getPages: AppPages.pages,
        defaultTransition: Transition.cupertino,
        home:ScopedModelDescendant<AuthModel>(
            builder: (context, child, model) {
              return StartPage();
            }),
      );
  }
}


