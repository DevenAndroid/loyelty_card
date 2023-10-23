

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loyelty_card/models/profile_model.dart';
import 'package:loyelty_card/models/qr_details_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<QrDetailsModel> getQrDetailsRepo({required ids}) async {
  try {
    http.Response response = await http.get(
      Uri.parse("https://api.pub2.passkit.io/members/member/id/$ids"),
        headers: { HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTgwNTk1NzMsImhhc2giOiI5MmFkNjBhOTYxYzg0NmRhNGNiODMyYWI5NDlmZGM5NWRjYThkNDZlZmZjMGMxOTVmNTQxZjBlNDUyZWM3OGY3IiwiaWF0IjoxNjk4MDU1OTczLCJyZWdpb24iOiJwdWIyIiwidWlkIjoiNTNtRGxQcnhSOFlta1dMa1pjSHZKZCIsIndlYiI6dHJ1ZX0.wf5Bcz94a3v3HC0KXJVIdWH1BThP00WDQMVz-wauDSM"  });

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
