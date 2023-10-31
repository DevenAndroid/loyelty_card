
import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import '../models/loyalty_list_model.dart';
import '../resourses/api_constant.dart';

Future<LoyaltyListModel> loyaltyCardList() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.loyaltyListUrl),
      headers: await getAuthHeader(),
    );
  log(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return LoyaltyListModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return LoyaltyListModel(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return LoyaltyListModel(message: e.toString(), status: false, data: null);
  }
}