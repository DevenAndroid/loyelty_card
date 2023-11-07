

import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loyelty_card/models/model_logout.dart';
import 'package:loyelty_card/models/updateQrScan_model.dart';
import 'package:loyelty_card/resourses/helper.dart';

import '../resourses/api_constant.dart';


Future<ModelQRUpdate> getUpdateRepo({context,required id}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.updateScan + id),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelQRUpdate.fromJson(jsonDecode(response.body));
    } else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelQRUpdate(
        message: jsonDecode(response.body)["message"],
        status: false,
      );
    }
  } catch (e) {
    return ModelQRUpdate(message: e.toString(), status: false, );
  }
}
