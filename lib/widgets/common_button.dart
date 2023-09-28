import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common_colour.dart';


  class CustomOutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool? expandedValue;
  final Color? textColor;

  const CustomOutlineButton(
      {Key? key,
        required this.title,
        this.onPressed,
         this.backgroundColor,
        this.textColor,
        this.expandedValue = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10),
      child: Container(

        width: MediaQuery.of(context).size.width,
        height: 49,
        decoration: BoxDecoration(
         color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
                side:  BorderSide(
                  color:  Colors.white,
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    )),

                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            onPressed: onPressed,
            child: expandedValue == true ? SizedBox(
              width: double.maxFinite,
              child: Center(
                child: Text(
                  title,
                  style:GoogleFonts.plusJakartaSans(
                      color:  Color(
                          0xFF2C91FF),
                      fontSize: 18,
                      fontWeight:
                      FontWeight
                          .w700),
                ),
              ),        )
                : Text(
              title,
              style:GoogleFonts.plusJakartaSans(
                  color:  Color(
                      0xFF2C91FF),
                  fontSize: 18,
                  fontWeight:
                  FontWeight
                      .w700),
            )),
      ),
    );
  }
}

AppBar backAppBar(
    {required title,
      required BuildContext context,
      String dispose = "",

      Color? textColor = Colors.black,
      Widget? icon,
      disposeController,}) {
  return
    AppBar(
      //shadowColor:  Colors.grey[400],
      toolbarHeight: 60,
      elevation: 0,
      titleSpacing: 5,
      surfaceTintColor: Colors.grey.shade300,
      // leadingWidth: AddSize.size40 * 0.9,
      backgroundColor: const Color(0xFF2C91FF),
      title: Text(
        title,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Colors.white
        ),
      ),
      leading: GestureDetector(
          onTap: () {
            Get.back();
            if (dispose == "dispose") {}
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ??
                  const Icon(Icons.arrow_back_sharp,color: Colors.white,size: 30,)
            ],
          )),
    );
}
