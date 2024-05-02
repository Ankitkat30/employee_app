
import 'package:employee_app/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



// all the links and constants will be here
String defaultAvatar =
    "https://www.pngitem.com/pimgs/m/30-307416_profile-icon-png-image-free-download-searchpng-employee.png";

// to locally store user model

double screenWidth = MediaQuery.of(Routes.currentContext).size.width;
double screenHeight = MediaQuery.of(Routes.currentContext).size.height;



// option and headers



class AppColors {
  static Color primary = const Color(0xff44198F);
  static Color splashBackground = const Color(0xffe9e6f2);

  static Color lightBlue = const Color(0xffE7F9FA);
  static Color textDark = const Color(0xff403E3E);
  static Color textHeading = const Color(0xff44198F);
  static Color text = const Color(0xff383838);
  static Color textLight = const Color(0xFF868788);
  static Color textGrey = const Color(0xff4a4a4a);
  static Color hoverColor = const Color(0xff5d00ff);
  static Color greyDark = const Color(0XFFB7BBBF);
  static Color buttonSecondaryColor = const Color(0XFF6c757d);
  static Color greyLight = const Color(0XFFD6D9DB);
  static Color white = const Color(0xFFFFFFFF);
  static Gradient secondaryGradient = const LinearGradient(
    colors: [Color(0xff25D366), Color(0xff03C0FF)],
    stops: [0, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static Color redColor = const Color(0xFFE12222);
}



class Themes {
  static ThemeData defaultTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    splashColor: Colors.transparent,
    useMaterial3: true,
    highlightColor: Colors.transparent,
  );
}

Text heading1Text(
  String text, {
  Color? color,
  TextDecoration? decoration,
  TextAlign? textAlign,
}) {
  return Text(text,
      textAlign: textAlign,
      style: GoogleFonts.hind(
        decoration: decoration,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: color,
      ));
}

Text heading2Text(
  String text, {
  Color? color,
  TextDecoration? decoration,
  TextAlign? textAlign,
}) {
  return Text(text,
      textAlign: textAlign,
      style: GoogleFonts.hind(
        decoration: decoration,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: color,
      ));
}

Text body1Text(
  String text, {
  Color? color,
  TextAlign? align,
  FontWeight? weight,
}) {
  return Text(text,
      textAlign: align,
      style: GoogleFonts.hind(
        fontSize: 18,
        fontWeight: weight ?? FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: color,
      ));
}

Text body2Text(
  String text, {
  Color? color,
}) {
  return Text(
    text,
    style: GoogleFonts.hind(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color,
    ),
  );
}

Text simpleText(
  String text, {
  TextAlign? align,
  Color? color,
  TextDecoration? decoration,
  FontWeight? fontWeight,
  double? fontSize,
  TextOverflow? overflow,
}) {
  return Text(
    text,
    overflow: overflow,
    textAlign: align,
    style: GoogleFonts.hind(
      decoration: decoration,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal,
      color: color,
    ),
  );
}

// sizedbox for height and width

SizedBox width(double size) {
  return SizedBox(
    width: size.w,
  );
}

SizedBox height(double size) {
  return SizedBox(
    height: size.h,
  );
}
