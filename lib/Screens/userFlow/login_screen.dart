import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/models/login_model.dart';
import 'package:loyelty_card/resourses/api_constant.dart';
import 'package:loyelty_card/routers/my_routers.dart';
import 'package:loyelty_card/widgets/common_button.dart';
import 'package:loyelty_card/widgets/common_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/login repo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey6 = GlobalKey<FormState>();
  Rx<RxStatus> statusOfLogin = RxStatus.empty().obs;
  Rx<LoginModel> login = LoginModel().obs;
  TextEditingController emailNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  loginCode() {
    if (formKey6.currentState!.validate()) {
      loginRepo(
        context: context,
        password: passwordController.text.trim(),
        email: emailNoController.text.trim(),
      ).then((value) async {
        login.value = value;
        if (value.status == true) {
          SharedPreferences pref = await SharedPreferences.getInstance();

          pref.setString('cookie', value.authToken.toString());
          Get.offAllNamed(MyRouters.scanCard);
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
                            "Welcome to Loyalty Card",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Email",
                          style:
                              GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
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
                          style:
                              GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
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
                        )
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
