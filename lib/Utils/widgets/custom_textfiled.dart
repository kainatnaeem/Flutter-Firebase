import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.label,
      this.controller,
      this.inputType,
      this.hintText,
      this.labelTheme,
      this.onChange});
  final String? label;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hintText;
  final TextStyle? labelTheme;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? "",
          style: labelTheme ??
              GoogleFonts.kanit(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 7,
        ),
        Container(
            width: 330,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: controller,
              keyboardType: inputType,
              onChanged: onChange,
              style: GoogleFonts.kanit(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.3)),
              cursorColor: Colors.grey.withOpacity(0.07),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(13),
                  hintText: hintText,
                  hintStyle: GoogleFonts.kanit(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.3)),
                  fillColor: Colors.grey.withOpacity(0.2),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  )),
            )),
        SizedBox(
          height: 12,
        )
      ],
    );
  }
}
