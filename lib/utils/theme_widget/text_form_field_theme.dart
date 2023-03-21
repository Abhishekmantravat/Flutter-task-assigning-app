import 'package:flutter/material.dart';

import '../../constant/colors.dart';




class TTextFormFieldTheme{
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
  InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: tSecondaryColor),
      prefixIconColor: tSecondaryColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(width: 2.0,color: tSecondaryColor)
      )
  );


  static InputDecorationTheme darkInputDecorationTheme =
  InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: tGreyColor),
      prefixIconColor: tGreyColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(width: 2.0,color: tGreyColor)
      )
  );
}