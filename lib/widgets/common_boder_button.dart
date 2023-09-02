import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common_colour.dart';
// import 'package:zip/widgets/common_colour.dart';




class CustomOutlineBoder extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool? expandedValue;
  final Color? textColor;

  const CustomOutlineBoder(
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
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFF2C91FF),
          // border: Border.all(color: AppTheme.buttonColor,width: 1.3)
        ),
        child: expandedValue == true ? SizedBox(
          width: double.maxFinite,
          child: Center(
            child: Text(
              title,
              style:GoogleFonts.plusJakartaSans(
                  color:  Colors.white,
                  fontSize: 18,
                  fontWeight:
                  FontWeight
                      .w700),
            ),
          ),        )
            : Center(
              child: Text(
          title,
                style:GoogleFonts.plusJakartaSans(
                    color:  Colors.white,
                    fontSize: 18,
                    fontWeight:
                    FontWeight
                        .w700),
        ),
            ),
      ),
    );
  }
}
