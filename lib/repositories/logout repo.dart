

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loyelty_card/models/model_logout.dart';
import 'package:loyelty_card/resourses/helper.dart';

import '../resourses/api_constant.dart';


Future<ModelLogout> getLogoutRepo(context) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  try {
    http.Response response = await http.get(
      Uri.parse("${ApiUrls.logout}"),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelLogout.fromJson(jsonDecode(response.body));
    } else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelLogout(
          message: jsonDecode(response.body)["message"],
          status: false,
          );
    }
  } catch (e) {
    return ModelLogout(message: e.toString(), status: false, );
  }
}
