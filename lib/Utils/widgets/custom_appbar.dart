import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
  });
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        title ?? "Text",
        style: GoogleFonts.kanit(
            fontSize: 40, color: Colors.black.withOpacity(0.3)),
      ),
      centerTitle: true,
    );
  }
}
