import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/routers/my_routers.dart';
import 'package:loyelty_card/widgets/common_button.dart';
import 'package:loyelty_card/widgets/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Image.asset("assets/images/bg.png")],
            ),
            SizedBox(
              height: 60,
            ),
            Image.asset("assets/images/loyalty.png"),
        SizedBox(height: 30,),

            Container(
              width: size.width,
              height: size.height * .52,
              decoration: BoxDecoration(
                  color: Color(0xFF2C91FF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        "Welcome to Loyalty Card",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    CommonTextfield(obSecure: false, hintText: "Enter email"),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    CommonTextfield(obSecure: false, hintText: "Enter password"),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: (){
                        Get.toNamed(MyRouters.scanCard) ;
                      },
                      child: CustomOutlineButton(
                        title: "Login",
                        backgroundColor: Colors.white,

                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
