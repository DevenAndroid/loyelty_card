import 'dart:async';

import 'package:flutter/material.dart';
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
    Timer(const Duration(seconds: 5), () async {
      // enableCheck = true;
      userCheck();
    }
    );
  }

  userCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('cookie') != null) {
      Get.offAllNamed(MyRouters.loginScreen);
    }
    else {
      Get.offAllNamed(MyRouters.loginScreen);
    }
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
                  'assets/images/Splash Screen.png'
              ),
                fit: BoxFit.fill,),
            )),
      );
    }
  }

