import 'package:befocus/core/core.dart';
import 'package:befocus/core/themes/ui/button/types/outlined_button_ui.dart';
import 'package:befocus/core/themes/ui/button/types/solid_button_ui.dart';
import 'package:befocus/core/themes/ui/button/types/text_button_ui.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
abstract class BaseButtonUI extends StatelessWidget {
  BaseButtonUI(
    this.text, {
    this.onPressed,
    this.suffixIcon,
    this.info,
    this.color,
    this.background,
    this.height,
    this.prefixIcon,
    this.width,
    this.body,
    super.key,
  });

  late Widget button;
  final String text;
  final void Function()? onPressed;
  final Widget? suffixIcon;
  final Color? color;
  final Color? background;
  final String? info;
  final double? height;
  final double? width;
  final Widget? prefixIcon;
  final Widget? body;

  void get outlined {
    button = OutlinedButtonUI(
      body: body ??
          FittedBox(
            child: TypographyUI(
              text,
              color: background ?? AppColors.orangePrimary,
              textAlign: TextAlign.center,
            )..body1,
          ),
      height: 48,
      width: width,
      borderSideColor: background ?? AppColors.orangePrimary,
      onPressed: onPressed,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  void get solid {
    button = SolidButtonUI(
      body: body ??
          FittedBox(
            child: TypographyUI(
              text,
              color: AppColors.backgroundColor,
              textAlign: TextAlign.center,
            )..body1,
          ),
      height: 48,
      width: width,
      backgroundColor: background ?? AppColors.orangePrimary,
      onPressed: onPressed,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  void get textButton {
    button = TextButtonUI(
      text: text,
      height: 48,
      textColor: color ?? AppColors.black,
      onPressed: onPressed,
    );
  }
}
