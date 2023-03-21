import 'package:flutter/material.dart';

import '../theme_widget/elevated_button_theme.dart';
import '../theme_widget/outlined_button_theme.dart';
import '../theme_widget/text_form_field_theme.dart';
import '../theme_widget/text_theme.dart';


class TAppTheme{
  static ThemeData lightTheme = ThemeData(
    brightness:Brightness.light ,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme:  TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );


  static ThemeData darkTheme = ThemeData(brightness:Brightness.dark,

    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme:  TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}