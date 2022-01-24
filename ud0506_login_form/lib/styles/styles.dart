import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleApp {
  //static const TextStyle title =TextStyle(fontSize: 25, fontWeight: FontWeight.w800);
  //static const TextStyle subtitle =TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  static const Color blackTextColor = Color(0xFF3c384c);
  static const Color bgWhite = Color(0xFFf5f3f3);
  static const Color primaryBtnColor = Color(0xFFe3716d);

  static BoxDecoration formInput = BoxDecoration( borderRadius: BorderRadius.circular(20.0), color: Colors.white);


  static TextStyle get title => GoogleFonts.getFont(
    'Montserrat',
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: blackTextColor
  );

  static TextStyle get subtitle => GoogleFonts.getFont(
    'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: blackTextColor
  );


}
