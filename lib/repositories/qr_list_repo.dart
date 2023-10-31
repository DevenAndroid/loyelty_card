
import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import '../models/loyalty_list_model.dart';
import '../models/qr_list_model.dart';
import '../resourses/api_constant.dart';

Future<QRListModel> qrListRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.QRListUrl),
      headers: await getAuthHeader(),
    );
    log(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return QRListModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return QRListModel(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return QRListModel(message: e.toString(), status: false, data: null);
  }
}