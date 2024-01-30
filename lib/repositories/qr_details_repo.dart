

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loyelty_card/Controller/qr_list_controller.dart';
import 'package:loyelty_card/models/profile_model.dart';
import 'package:loyelty_card/models/qr_details_model.dart';
import '../models/model_get_data.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';
// final controller = Get.put(QrListController());
Future<ModelQrDetails> getQrDetailsRepo({required ids}) async {
  try {

    http.Response response = await http.get(Uri.parse("https://loyaltycardgenerator.com/backend/api/get-user-details/$ids"),
        headers: await getAuthHeader(), );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelQrDetails.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelQrDetails()
         ;
    }
  } catch (e) {
    return ModelQrDetails();
  }
}
