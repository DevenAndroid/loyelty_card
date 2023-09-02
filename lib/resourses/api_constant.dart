// import 'dart:io';
// import 'dart:ui';
//
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../widgets/common_colour.dart';
//
//
//
//
// class ApiUrls {
//   static const String apiBaseUrl = 'https://zipfintech.eoxyslive.com/api/';
//   static const String otps = "${apiBaseUrl}otps";
//
// }
//
// Future getAuthHeader() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   // pref.getString("cookie")!.toString().replaceAll('\"', '');
//   var gg ={
//      HttpHeaders.contentTypeHeader: 'application/json',
//      HttpHeaders.acceptHeader: 'application/json',
//
//     // HttpHeaders.authorizationHeader:"FLWSECK_TEST-SANDBOXDEMOKEY-X"
//     if(pref.getString("cookie") != null)
//       HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
//   };
//   print(gg);
//   return gg;
// }
// Future getAuthHeaderApi() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   // pref.getString("cookie")!.toString().replaceAll('\"', '');
//   var gg ={
//     HttpHeaders.contentTypeHeader: 'application/json',
//     HttpHeaders.acceptHeader: 'application/json',
//     // FLWSECK_TEST-2e4497e1d44affec2b5bb40148e43193-X
//      HttpHeaders.authorizationHeader:"FLWSECK_TEST-SANDBOXDEMOKEY-X"
//     // if(pref.getString("cookie") != null)
//     //   HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
//   };
//   print(gg);
//   return gg;
// }
//
//
// // HttpHeaders.contentTypeHeader: 'application/json',
// // HttpHeaders.acceptHeader: 'application/json',
// //     HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
//
// showToast(message) {
//   Fluttertoast.cancel();
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: AppTheme.secondaryColor,
//       textColor: Color(0xffffffff),
//       fontSize: 14);
// }