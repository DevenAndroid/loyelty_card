import 'dart:async';
import 'dart:developer';

import 'package:client_information/client_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loyelty_card/routers/my_routers.dart';


import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  bool enableCheck = false;

  @override
  void initState() {
    super.initState();
    _getClientInformation();
    Timer(const Duration(seconds: 5), () async {
      // enableCheck = true;
      userCheck();
    }
    );
  }

  userCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('cookie') != null) {
      if (pref.getString('cookieOne') != null) {
        Get.offAllNamed(MyRouters.scanCard);
      }
      else {
        Get.offAllNamed(MyRouters.loginScreen);

      }
      Get.offAllNamed(MyRouters.loginEmail);
    }

      else {
        Get.offAllNamed(MyRouters.loginScreen);

      }



  }
  Future<void> _getClientInformation() async {
    ClientInformation? info;
    try {
      info = await ClientInformation.fetch();
    } on PlatformException {
      log('Failed to get client information');
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('deviceId', info!.deviceId.toString());
  }
    Widget build(BuildContext context) {
      Size size = MediaQuery
          .of(context)
          .size;
      return GestureDetector(
        onTap: enableCheck ? () {
          userCheck();
        } : null,
        behavior: HitTestBehavior.translucent,
        child: Scaffold(
            body: Container(
              height: size.height,
              width: size.width,
              child: Image.asset((
                  'assets/images/splash.png'
              ),
                fit: BoxFit.fill,),
            )),
      );
    }
  }

