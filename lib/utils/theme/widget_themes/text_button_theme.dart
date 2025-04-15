import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Text Button Themes -- */
class TTextButtonTheme {
  TTextButtonTheme._();

  /* -- Light Theme -- */
  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: TColors.primary.withValues(alpha: 0.5),
      disabledForegroundColor: TColors.darkGrey,
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
      textStyle: TextStyle(
        fontSize: 14,
        color: TColors.black,
        fontWeight: FontWeight.w500,
        fontFamily: 'Urbanist',
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: TColors.light,
      disabledForegroundColor: TColors.darkerGrey,
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 14,
        color: TColors.textWhite,
        fontWeight: FontWeight.w600,
        fontFamily: 'Urbanist',
      ),
    ),
  );
}
