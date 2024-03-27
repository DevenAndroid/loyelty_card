import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/models/login_model.dart';
import 'package:loyelty_card/models/model_qr_login.dart';
import 'package:loyelty_card/repositories/login%20repo.dart';
import 'package:loyelty_card/resourses/api_constant.dart';
import 'package:loyelty_card/routers/my_routers.dart';
import 'package:loyelty_card/widgets/common_button.dart';
import 'package:loyelty_card/widgets/common_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../web_view_screen.dart';
// import '../../repositories/login repo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _scanBarcode2 = 'Unknown';
  String str = '';
  void removeLastString() {
    str = "XQ#d%wLHuv2Vt\$#123456783n85Q#\$Luzc!VAA";
  }




  ModelQrLogin qRLogin = ModelQrLogin();

  /// For Continuous scan
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver('#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> barcodeScan() async {
    String? barcodeScanRes;
    try {
      barcodeScanRes =
          await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR).then((value) async {
        var response = jsonDecode(value);
        str = response["password"];
        log(str);
        String result = str.substring(15, str.length - 15);
        log(result);
        log(response["email"]);
        var fcmToken;
        if (Platform.isIOS) {
          fcmToken = "agfjshfgsdh";
        } else {
          fcmToken = await FirebaseMessaging.instance.getToken();
        }
        loginRepo(
          context: context,
          password: result,
          email: response["email"],
          fcmToken: fcmToken!,
        ).then((value) async {
          login.value = value;
          if (value.status == true) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString('cookieOne', value.authToken.toString());

            // Get.offAllNamed(MyRouters.scanCard);
            Get.offAllNamed(MyRouters.staffListScreen);
            statusOfLogin.value = RxStatus.success();
            showToast(value.message.toString());
          } else {
            statusOfLogin.value = RxStatus.error();
            showToast(value.message.toString());
          }
        });
        return null;
      });

      if (kDebugMode) {
        print(barcodeScanRes!);
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode2 = barcodeScanRes!;
    });
  }

  final formKey6 = GlobalKey<FormState>();
  Rx<RxStatus> statusOfLogin = RxStatus.empty().obs;
  Rx<LoginModel> login = LoginModel().obs;
  TextEditingController emailNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  loginCode() async {
    var fcmToken;
    if (Platform.isIOS) {
      fcmToken = "agfjshfgsdh";
    } else {
      fcmToken = await FirebaseMessaging.instance.getToken();
    }
    print("etryytgghrg" + fcmToken!);
    if (formKey6.currentState!.validate()) {
      loginRepo(
        fcmToken: fcmToken!,
        context: context,
        password: passwordController.text.trim(),
        email: emailNoController.text.trim(),
      ).then((value) async {
        login.value = value;
        if (value.status == true) {
          SharedPreferences pref = await SharedPreferences.getInstance();

          pref.setString('cookie', value.authToken.toString());
          Get.offAllNamed(MyRouters.loginEmail);
          statusOfLogin.value = RxStatus.success();
          showToast(value.message.toString());
        } else {
          statusOfLogin.value = RxStatus.error();
          showToast(value.message.toString());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey6,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [Image.asset("assets/images/bg.png")],
              ),
              const SizedBox(
                height: 60,
              ),
              Image.asset("assets/images/loyalty.png"),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: size.width,
                height: size.height * .52,
                decoration: const BoxDecoration(
                    color: Color(0xFF2C91FF),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "Welcome to Loyalty Card Generator",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Email",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        CommonTextfield(
                          obSecure: false,
                          hintText: "Enter email",
                          controller: emailNoController,
                          validator: (value) {
                            if (emailNoController.text.isEmpty) {
                              return "Please enter your email";
                            } else if (emailNoController.text.contains('+') || emailNoController.text.contains(' ')) {
                              return "Email is invalid";
                            } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(emailNoController.text)) {
                              return null;
                            } else {
                              return 'Please type a valid email address';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Password",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        CommonTextfield(
                          obSecure: false,
                          hintText: "Enter password",
                          controller: passwordController,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Please enter your password'),
                            MinLengthValidator(8,
                                errorText:
                                    'Password must be at least 8 characters, with 1 special character & 1 numerical'),
                            PatternValidator(r"(?=.*\W)(?=.*?[#?!@$%^&*-])(?=.*[0-9])",
                                errorText: "Password must be at least with 1 special character & 1 numerical"),
                          ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            loginCode();
                            // Get.toNamed(MyRouters.scanCard) ;
                          },
                          child: const CustomOutlineButton(
                            title: "Login",
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                barcodeScan();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  )),
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                  textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                              child: Text(
                                "Staff Login",
                                style: GoogleFonts.plusJakartaSans(
                                    color: const Color(0xFF2C91FF), fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't Have An Account?",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            InkWell(
                              onTap: () async {

                                // const url = 'https://www.google.com';
                                // if (await canLaunch(url)) {
                                // await launch(url);
                                // } else {
                                // throw 'Could not launch $url';
                                // }
                               Get.to(WebViewScreen());
                              },
                              child: Text(
                                ' Sign Up',
                                style: TextStyle(color: Color(0xff3E3E3E), fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
