
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loyelty_card/Controller/qr_list_controller.dart';
import 'package:loyelty_card/models/model_update_scan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_model.dart';

import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

final controller = Get.put(QrListController());

Future<ModelUpdate> updateScanRepo({id,
tierId,
programId,
  displayName,
  year,
  month,
  day,
  emailAddress,
  mobileNumber,
  remainingpoints,
  rewards,
  points,
  context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  var map1 = <String, dynamic>{};
  var map2 = <String, dynamic>{};
  var map3 = <String, dynamic>{};
  SharedPreferences pref = await SharedPreferences.getInstance();
  map['id'] =          id;
  map['tierId'] =      tierId;
  map['points'] =      points;
  map['programId'] =   programId;
  map1['displayName'] =   displayName;
  map1['emailAddress'] =  emailAddress;
  map1['mobileNumber'] =  mobileNumber;
  map2['year'] =   year;
  map2['month'] =  month;
  map2['day'] =   day;
  map3['remainingpoints'] =   remainingpoints;
  map3['rewards'] =   rewards;
  map1['dateOfBirth'] =   map2;
  map['programId'] =   programId;
  map['person'] =   map1;
  map['metaData'] =   map3;



  print(map);
  // try {
  http.Response response = await http.put(
      Uri.parse("https://api.pub2.passkit.io/members/member"),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader:controller.testToken.toString() },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelUpdate.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelUpdate( );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}