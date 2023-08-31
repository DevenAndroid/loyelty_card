import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screens/scanner/scan.dart';
import '../Screens/userFlow/login_screen.dart';
import '../Screens/userFlow/signup_screen.dart';
import '../splash1.dart';


class MyRouters{
  static var splash = "/splash";
  static var loginScreen = "/loginScreen";
  static var signUpScreen = "/signUpScreen";
  static var scanQrCode = "/scanQrCode";


  static var route = [
    GetPage(name: '/', page: () =>     const Splash()),
    GetPage(name: '/loginScreen', page: () =>   const LoginScreen()),
    GetPage(name: '/signUpScreen', page: () =>   const SignUpScreen()),
    GetPage(name: '/scanQrCode', page: () =>   const ScanQrCode()),


  ];
}