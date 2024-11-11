import 'package:befocus/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyleFormUI {
  static TextStyle get label => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.greyDefault,
        fontFamily: 'Roboto',
        letterSpacing: 0.44,
      );
  static TextStyle get boldLabel => TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );
  static TextStyle get errorLabel => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.red,
        fontFamily: 'Roboto',
        letterSpacing: 0.44,
      );
}
