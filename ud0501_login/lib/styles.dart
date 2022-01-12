import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle{

  //COLORS

  static const Color primaryColor = Color(0xFF5C38493);


  // MARGINS, PADDINGS, CARD PROPERTIES

  static const double bodyPadding = 20.0;
  static const double bodyMargin = 13.0;


//TEXT STYLES

  /* FONT SIZES */
  static const double textSizeSmall = 14.0;
  static const double textSizeMedium = 20.0;
  /*            */

static TextStyle get texTitle => GoogleFonts.getFont(
  
  'Nunito',
  color: AppStyle.primaryColor,
  fontWeight: FontWeight.w500,
  fontSize: textSizeSmall

);

//VARIABLE DINÁMICA
static TextStyle textTitleCustom(Color c, double fSize) => GoogleFonts.getFont(
  
  'Nunito',
  color: c,
  fontWeight: FontWeight.w500,
  fontSize: fSize

);

}