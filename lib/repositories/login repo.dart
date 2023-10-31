import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_model.dart';

import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<LoginModel> loginRepo({email,context,password,required String fcmToken}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  SharedPreferences pref = await SharedPreferences.getInstance();
  map['email'] = email;
  map['password'] = password;
  map['device_id'] = pref.getString("deviceId");
  map['device_token'] = fcmToken;


  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.login),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return LoginModel.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return LoginModel(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}