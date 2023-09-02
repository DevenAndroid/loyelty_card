import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyelty_card/routers/my_routers.dart';
import 'package:loyelty_card/widgets/common_boder_button.dart';

import '../../widgets/common_textfield.dart';
class ScanCard extends StatefulWidget {
  const ScanCard({super.key});

  @override
  State<ScanCard> createState() => _ScanCardState();
}

class _ScanCardState extends State<ScanCard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: InkWell(
            onTap: (){
              Get.toNamed(MyRouters.cardRecordScreen);
            },
            child: CustomOutlineBoder(title: 'Scan',)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 30,),

        Text("Logged in as:" ,style: GoogleFonts.plusJakartaSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF33454D)),),
          SizedBox(height: 10,),
    Text("Jack  Smith" ,style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0073DA)),),
          SizedBox(height: 30,),           

        Image.asset("assets/images/card.png"),


            ],
          ),
        ),
      ),
    );
  }
}
