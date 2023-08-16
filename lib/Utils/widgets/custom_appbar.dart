import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.leadingBackIcon = true,
  });
  final String? title;
  final bool? leadingBackIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: leadingBackIcon!,
      title: Text(
        title ?? "Text",
        style: GoogleFonts.kanit(
            fontSize: 25, color: Colors.black.withOpacity(0.3)),
      ),
      centerTitle: true,
    );
  }
}
