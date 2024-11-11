// ignore_for_file: avoid_positional_boolean_parameters

import 'package:befocus/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckBoxButton extends StatelessWidget {
  const CheckBoxButton({
    required this.name,
    required this.text,
    required this.onChanged,
    required this.validator,
    this.enabled = true,
    this.onReset,
    this.secondary,
    this.initialValue = false,
    super.key,
  });

  final String name;
  final String text;
  final bool enabled;
  final void Function(bool?)? onChanged;
  final void Function()? onReset;
  final FormFieldValidator<bool>? validator;
  final Widget? secondary;
  final bool? initialValue;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: 0,
      child: Theme(
        data: ThemeData(
          checkboxTheme: CheckboxThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return AppColors.backgroundColor;
                }
                return AppColors.orangePrimary;
              },
            ),
            side: WidgetStateBorderSide.resolveWith(
              (Set<WidgetState> states) {
                return BorderSide(color: AppColors.backgroundColor);
              },
            ),
          ),
        ),
        child: FormBuilderCheckbox(
          initialValue: initialValue,
          secondary: secondary,
          name: name,
          title: TypographyUI(
            text,
            color: AppColors.black,
          )..body1,
          checkColor: AppColors.backgroundColor,
          onChanged: onChanged,
          onReset: () => onReset,
          enabled: enabled,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            errorStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              height: 0.12,
              letterSpacing: 0.10,
              color: AppColors.dangerSystem,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
          ),
        ),
      ),
    );
  }
}
