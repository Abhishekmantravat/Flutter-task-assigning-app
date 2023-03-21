import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/sizes.dart';


class TElevatedButtonTheme{

//to avoid creating instance

  TElevatedButtonTheme._();
//  for light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        foregroundColor: tWhiteColor,
        backgroundColor: tSecondaryColor,
        side: BorderSide(color: tSecondaryColor),
        padding:EdgeInsets.symmetric(vertical: tButtonHeight)

    ),
  );

//  for the dark theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        foregroundColor: tSecondaryColor,
        backgroundColor: tWhiteColor,
        side: BorderSide(color: tWhiteColor),
        padding:EdgeInsets.symmetric(vertical: tButtonHeight)

    ),
  );

}