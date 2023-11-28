
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

// final controller = Get.put(QrListController());

Future<ModelUpdate> updateScanRepo({
  token,stamps,staffid,

  context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  SharedPreferences pref = await SharedPreferences.getInstance();
  map['token'] =          token;
  map['stamps'] =          stamps;
  map['staff_id'] =          staffid;




  print(map);
  // try {


  http.Response response = await http.post(Uri.parse(ApiUrls.updateScan),
       headers: await getAuthHeader(),body: jsonEncode(map) );
  log("Sign IN DATA${response.body}");
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