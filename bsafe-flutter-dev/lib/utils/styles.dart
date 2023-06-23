import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bsafe/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

var rubikRegular = GoogleFonts.mulish(
  // fontFamily: 'Mulish',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w400,
);
var mulishLarge= GoogleFonts.mulish(
  // fontFamily: 'Mulish',
  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
  fontWeight: FontWeight.w700,
);
var rubikMedium = GoogleFonts.mulish(
  // fontFamily: 'Mulish',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w500,
);

var rubikBold = GoogleFonts.mulish(
  // fontFamily: 'Mulish',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w700,
);


const segoeBold = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.FONT_SIZE_DEFAULT
);

const segoeBold17 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: Dimensions.FONT_SIZE_LARGE2
);

const segoeItalic = TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: Dimensions.FONT_SIZE_DEFAULT
);

const segoeNormal = TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: Dimensions.FONT_SIZE_DEFAULT
);

const robotoMediumItalic = TextStyle(
  fontFamily: 'Roboto',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w700,
);

const robotoRegular = TextStyle(
  fontFamily: 'Roboto',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w400,
);

const robotoHeadingStyle = TextStyle(color: Color.fromRGBO(41, 41, 41,1),fontFamily: 'Roboto', fontSize: 22,fontWeight: FontWeight.w800,height: 1.5);
const robotoTabSelectedStyle = TextStyle(color: Color.fromRGBO(41, 41, 41,1),fontFamily: 'Roboto', fontSize: 16,fontWeight: FontWeight.w800);
const robotoTabUnSelectedStyle = TextStyle(color: Color.fromRGBO(41, 41, 41,1),fontFamily: 'Roboto', fontSize: 16);
const robotoItemName = TextStyle(color: Color.fromRGBO(41, 41, 41,1),fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w400);
const robotoItemNameAbhi = TextStyle(color: Color.fromRGBO(41, 41, 41,1),fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w400);
