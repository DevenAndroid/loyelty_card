

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loyelty_card/models/profile_model.dart';
import 'package:loyelty_card/models/staff_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelStaffList> getStaffRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.staffList),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelStaffList.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelStaffList(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ModelStaffList(message: e.toString(), status: false, data: null);
  }
}
