import 'package:flutter/material.dart';
import 'package:mobile_app/auth/forget/controller/cubit/OTP.dart';
import 'package:mobile_app/dashboard/modules/Fav/View/fav_page.dart';
import 'package:mobile_app/dashboard/view/dashboard_page.dart';
import 'package:mobile_app/screens/Login_Page.dart';
import 'package:mobile_app/screens/Sign_up.dart';
import 'package:mobile_app/screens/confirm.dart';
import 'package:mobile_app/screens/reset_pass.dart';
import 'package:mobile_app/screens/home.dart';
import 'package:mobile_app/screens/onbording.dart';

class MyRoutes {
  static List<Route> intitialRoute = [
    MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => onBoardingPage()),
  ];
  static List<Route> intitial1 = [
    MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => DashboardPage()),
  ];
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case 'home':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => HomePage());
      case 'login':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => Login());
      case 'signup':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => SignUp());
      case 'forgetpassword':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => ForgetPass());
      case 'confirm':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => Confirm());
      case 'otp':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => OPTScreen());
      case 'dashboard':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => DashboardPage());
      case 'Fav':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => FavScreen());

      default:
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => onBoardingPage());
    }
  }
}
