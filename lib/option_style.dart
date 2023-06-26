import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionStyle extends StatelessWidget {
  const OptionStyle(this.text, this.function, {super.key});
  final String text;
  final void Function() function;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
