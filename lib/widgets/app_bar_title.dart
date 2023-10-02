import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.tittle,
  });

  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      style: GoogleFonts.besley(
        textStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
