


import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pocket_law/pages/add_complaint.dart';
import 'package:pocket_law/pages/add_crime.dart';
import 'package:pocket_law/pages/add_vehicle.dart';
import 'package:pocket_law/pages/confirmed_payment.dart';
import 'package:pocket_law/pages/create_offender.dart';
import 'package:pocket_law/pages/dashboard.dart';
import 'package:pocket_law/pages/login_page.dart';
import 'package:pocket_law/pages/payment.dart';

class Routes {
  static const String dashboard = '/dashboard';
  static const String login = '/login';
  static const String createOffender = '/create-offender';
  static const String addCrime = '/add-crime';
  static const String addVehicle = '/add-vehicle';
  static const String payment = '/payment';
  static const String confirmPayment = '/confirm-payment';
  static const String addComplaint = '/add-complaint';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.dashboard, page: () => Dashboard()),
    GetPage(name: Routes.login, page: () => LoginPage()),
    GetPage(name: Routes.createOffender, page: () => CreateOffender()),
    GetPage(name: Routes.addCrime, page: () => AddCrime()),
    GetPage(name: Routes.addVehicle, page: () => AddVehiclePage()),
    GetPage(name: Routes.payment, page: () => Payment()),
    GetPage(name: Routes.confirmPayment, page: () => ConfirmedPaymentPage()),
    GetPage(name: Routes.addComplaint, page: () => AddComplaint()),
  ];
}
