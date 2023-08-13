import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({
    super.key,
    required this.label,
    this.controller,
    this.inputType,
    this.hintText,
    this.labelTheme,
    this.obscureText = false, // New property for password visibility
  });

  final String label;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hintText;
  final TextStyle? labelTheme;
  final bool obscureText; // New property for password visibility

  @override
  _PasswordTextfieldState createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: widget.labelTheme ??
              GoogleFonts.kanit(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 7),
        Container(
          width: 330,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.inputType,
            obscureText: _obscureText, // Use the obscureText property
            style: GoogleFonts.kanit(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.3)),
            cursorColor: Colors.grey.withOpacity(0.07),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(13),
              hintText: widget.hintText,
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
