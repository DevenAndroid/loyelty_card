

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loyelty_card/Controller/qr_list_controller.dart';
import 'package:loyelty_card/models/profile_model.dart';
import 'package:loyelty_card/models/qr_details_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';
final controller = Get.put(QrListController());
Future<QrDetailsModel> getQrDetailsRepo({required ids}) async {
  try {
    http.Response response = await http.get(
      Uri.parse("https://api.pub2.passkit.io/members/member/id/$ids"),
        headers: { HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:controller.testToken.toString() });

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return QrDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return QrDetailsModel()
         ;
    }
  } catch (e) {
    return QrDetailsModel();
  }
}
