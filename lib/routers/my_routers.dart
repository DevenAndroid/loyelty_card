import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:loyelty_card/Screens/loyalty_card_list.dart';
import 'package:loyelty_card/Screens/userFlow/login_with_email.dart';
import 'package:loyelty_card/Screens/userFlow/scanner_sceen.dart';
import 'package:loyelty_card/Screens/userFlow/staff_list.dart';

import '../Screens/qr code list.dart';
import '../Screens/scanner/scan.dart';
import '../Screens/userFlow/card_record_screen.dart';
import '../Screens/userFlow/login_screen.dart';
import '../Screens/userFlow/qr screen.dart';
import '../Screens/userFlow/sacn_card.dart';
import '../Screens/userFlow/signup_screen.dart';
import '../splash1.dart';


class MyRouters{
  static var splash = "/splash";
  static var loginScreen = "/loginScreen";
  static var signUpScreen = "/signUpScreen";
  static var scanQrCode = "/scanQrCode";
  static var scanCard = "/scanCard";
  static var cardRecordScreen = "/cardRecordScreen";
  static var qrCodeList = "/qrCodeList";
  static var qrScreen = "/qrScreen";
  static var staffListScreen = "/staffListScreen";
  static var loginEmail = "/loginEmail";
  static var scannerScreen = "/scannerScreen";


  static var route = [
    GetPage(name: '/', page: () =>     const Splash()),
    GetPage(name: '/loginScreen', page: () =>   const LoginScreen()),
    GetPage(name: '/signUpScreen', page: () =>   const SignUpScreen()),
    GetPage(name: '/scanQrCode', page: () =>   const ScanQrCode()),
    GetPage(name: '/scanCard', page: () =>   const ScanCard()),
    GetPage(name: '/cardRecordScreen', page: () =>   const CardRecordScreen()),
    GetPage(name: LoyaltyCardListScreen.loyaltyCardListScreen, page: () =>   const LoyaltyCardListScreen()),
    GetPage(name: '/qrCodeList', page: () =>   const QrCodeList()),
    GetPage(name: '/qrScreen', page: () =>   const QrScreen()),
    GetPage(name: '/staffListScreen', page: () =>   const StaffListScreen()),
    GetPage(name: '/loginEmail', page: () =>   const LoginEmail()),
    GetPage(name: '/scannerScreen', page: () =>   const ScannerScreen()),



  ];
}