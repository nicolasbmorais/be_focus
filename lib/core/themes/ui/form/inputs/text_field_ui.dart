import 'package:befocus/core/themes/app_colors.dart';
import 'package:befocus/core/themes/ui/form/inputs/base_input.dart';
import 'package:befocus/core/themes/ui/form/inputs/text_style_form_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextFieldUI extends BaseInput {
  const TextFieldUI({
    required super.name,
    required super.hintText,
    super.key,
    super.initialValue,
    super.label,
    super.suffixIcon,
    super.suffixIcononTap,
    super.controller,
    super.enabled,
    super.paddingBottom,
    super.minLines,
    super.maxLines,
    super.customFillColor,
    this.textInputFormatter = defaultTextInputFormatter,
    super.onChanged,
    super.textInputAction,
    super.onSubmitted,
    super.keyboardType,
    super.onTap,
    this.width,
    this.maxLength,
    this.validator,
    this.labelStyle,
  });

  final List<TextInputFormatter> textInputFormatter;
  final double? width;
  final int? maxLength;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;

  static const List<TextInputFormatter> defaultTextInputFormatter = [];

  @override
  BaseInputState<TextFieldUI> createState() => _TextFieldUIState();
}

class _TextFieldUIState extends BaseInputState<TextFieldUI> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.paddingBottom),
        child: FormBuilderTextField(
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          focusNode: focusNode,
          controller: controller,
          initialValue: widget.initialValue,
          name: widget.name,
          style: TextStyleFormUI.label,
          cursorColor: AppColors.black,
          validator: widget.validator,
          decoration: makeDecoration(),
          enabled: widget.enabled,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          inputFormatters: widget.textInputFormatter,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          onSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
