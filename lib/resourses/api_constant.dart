 import 'dart:io';
 import 'dart:ui';

 import 'package:fluttertoast/fluttertoast.dart';
 import 'package:shared_preferences/shared_preferences.dart';

 import '../widgets/common_colour.dart';




 class ApiUrls {
   static const String apiBaseUrl = 'https://loyaltycardgenerator.com/backend/api/';
   static const String login = "${apiBaseUrl}login";
   static const String profile = "${apiBaseUrl}user-profile";
   static const String loyaltyListUrl = "${apiBaseUrl}business-list";
   static const String QRListUrl = "${apiBaseUrl}list-qrcode";
   static const String logout = "${apiBaseUrl}logout";
   static const String createToken = "${apiBaseUrl}create-token";
   static const String staffList = "${apiBaseUrl}staff-list";
   static const String updateScan = "${apiBaseUrl}update-scan?staff_id=";


 }

 Future getAuthHeader() async {
   SharedPreferences pref = await SharedPreferences.getInstance();
   // pref.getString("cookie")!.toString().replaceAll('\"', '');
   var gg ={
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',

     // HttpHeaders.authorizationHeader:"FLWSECK_TEST-SANDBOXDEMOKEY-X"
     if(pref.getString("cookie") != null)
       HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
     if(pref.getString("cookieOne") != null)
       HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookieOne")!.toString().replaceAll('\"', '')}',
   };
   print(gg);
   return gg;
 }



 // HttpHeaders.contentTypeHeader: 'application/json',
 // HttpHeaders.acceptHeader: 'application/json',
 //     HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',

 showToast(message) {
   Fluttertoast.cancel();
   Fluttertoast.showToast(
       msg: message,
       toastLength: Toast.LENGTH_LONG,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 1,
       backgroundColor: AppTheme.secondaryColor,
       textColor: Color(0xffffffff),
       fontSize: 14);
 }