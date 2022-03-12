import 'package:flutter/cupertino.dart';

class AppStyles {
  static TextStyle thin(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bold(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }
}
