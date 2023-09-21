import 'package:flutter/material.dart';
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
