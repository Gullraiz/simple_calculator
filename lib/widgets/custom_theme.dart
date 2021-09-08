import 'package:flutter/material.dart';
import 'package:simple_calculator/models/my_colors.dart';

class CustomTheme {
  
  Color dynamicColor(
      BuildContext context, Color lightThemeColor, Color darkThemeColor) {
    if (Theme.of(context).brightness == Brightness.light) {
      return lightThemeColor;
    } else if (Theme.of(context).brightness == Brightness.dark) {
      return darkThemeColor;
    } else {
      return Colors.red;
    }
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: MyColors.myBlue,
      scaffoldBackgroundColor: MyColors.myWhiteBlue,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: MyColors.myGrey,
      scaffoldBackgroundColor: MyColors.myDarkBlue,
    );
  }
}
