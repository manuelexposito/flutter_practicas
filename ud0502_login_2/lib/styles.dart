import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle{

  //COLORS

  static const Color facebookColor = Color(0xFF3b5998);
  static const Color white = Color(0xFFF5FAFA);

  
  //TEXT STYLES
  //TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold ), textAlign: TextAlign.center,)
  
  static const FontWeight titleWeight= FontWeight.w600;
  
  static const FontWeight mediumTextWeight = FontWeight.w800;

  static const double textTitleSize = 27;
  static const double smallTextSize = 18;
  
  static TextStyle get textTitle => GoogleFonts.getFont(

    'Poppins',
    color: AppStyle.white,
    fontWeight: titleWeight,
    fontSize: textTitleSize

  );

  static TextStyle get signInGrayText => GoogleFonts.getFont(
    'Poppins',
    color: Color(0xFF7E8787),
    fontWeight: mediumTextWeight,
    fontSize: 12.0
  );

  //MARGINS, PADDINGS

  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 70, vertical: 15);
  static const EdgeInsets dividerMargin = EdgeInsets.only(top: 20);

//BUTTONS STYLES

  //static const ButtonStyle googleBtn = ElevatedButton.styleFrom(textStyle: AppStyle.textGoogleBtn);



}