import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/sizes.dart';


class TOutlinedButtonTheme{

//to avoid creating instance

  TOutlinedButtonTheme._();
//  for light theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: StadiumBorder(),
        foregroundColor: tSecondaryColor,
        side: BorderSide(color: tSecondaryColor),
        padding:EdgeInsets.symmetric(vertical: tButtonHeight)

    ),
  );

//  for the dark theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: StadiumBorder(),
        foregroundColor: tWhiteColor,
        side: BorderSide(color: tWhiteColor),
        padding:EdgeInsets.symmetric(vertical: tButtonHeight)

    ),
  );

}