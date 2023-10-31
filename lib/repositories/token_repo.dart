

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loyelty_card/models/model_get_token.dart';
import 'package:loyelty_card/models/model_logout.dart';
import 'package:loyelty_card/resourses/helper.dart';

import '../resourses/api_constant.dart';


Future<ModelGetToken> getTokenRepo() async {

  try {
    http.Response response = await http.get(
      Uri.parse("${ApiUrls.createToken}"),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelGetToken.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelGetToken(
        message: jsonDecode(response.body)["message"],
        status: false,
      );
    }
  } catch (e) {
    return ModelGetToken(message: e.toString(), status: false, );
  }
}
