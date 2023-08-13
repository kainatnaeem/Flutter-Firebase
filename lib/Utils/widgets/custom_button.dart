import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustombuttonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final double? buttonWidth;
  final String? text;
  final double? buttonHeight;
  final double? buttonElevation;
  final Color? buttonBackgroundColor;
  final Color? textColor;
  final double? buttonborderRadius;
  final EdgeInsetsGeometry? margin;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustombuttonWidget(
      {Key? key,
      required this.onPressed,
      this.margin,
      this.buttonBackgroundColor,
      this.buttonWidth,
      this.buttonElevation,
      this.buttonHeight,
      this.buttonborderRadius,
      this.fontSize,
      this.fontWeight,
      this.text,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: buttonWidth ?? 45,
        height: buttonHeight ?? 35,
        // margin: margin ?? const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                elevation: buttonElevation ?? 2,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(buttonborderRadius ?? 8.0),
                ),
                backgroundColor:
                    buttonBackgroundColor ?? const Color(0xff26A4FF)),
            child: Text(
              text!,
              textAlign: TextAlign.center,
              style: GoogleFonts.kanit(
                fontSize: fontSize ?? 17,
                fontWeight: fontWeight ?? FontWeight.w700,
                color: textColor ?? Colors.white,
              ),
            )));
  }
}
