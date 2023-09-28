

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loyelty_card/models/profile_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ProfileModel> getProfileRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse("${ApiUrls.profile}"),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ProfileModel(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ProfileModel(message: e.toString(), status: false, data: null);
  }
}
