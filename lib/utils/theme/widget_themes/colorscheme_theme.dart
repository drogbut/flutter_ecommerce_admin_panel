import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TColorScheme {
  static final ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: TColors.white,
    onPrimary: TColors.textWhite,
    secondary: TColors.secondary,
    onSecondary: TColors.textPrimary,
    surface: TColors.light,
    onSurface: TColors.textSecondary,
    error: TColors.error,
    onError: TColors.textWhite,
    primaryContainer: TColors.lightContainer,
    onPrimaryContainer: TColors.textPrimary,
    secondaryContainer: TColors.buttonSecondary,
    onSecondaryContainer: TColors.textWhite,
  );

  static final ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: TColors.primary,
    onPrimary: TColors.textWhite,
    secondary: TColors.secondary,
    onSecondary: TColors.dark,
    surface: TColors.darkContainer,
    onSurface: TColors.textWhite,
    error: TColors.error,
    onError: TColors.textWhite,
    primaryContainer: TColors.darkContainer,
    onPrimaryContainer: TColors.light,
    secondaryContainer: TColors.buttonSecondary,
    onSecondaryContainer: TColors.textWhite,
  );
}
