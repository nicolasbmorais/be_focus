import 'package:befocus/core/core.dart';
import 'package:befocus/core/themes/ui/form/inputs/base_input.dart';
import 'package:befocus/core/themes/ui/form/inputs/text_style_form_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DropdownUI extends BaseInput {
  const DropdownUI({
    required super.name,
    required super.hintText,
    required this.validator,
    super.onChanged,
    super.label,
    super.suffixIcon,
    super.initialValue,
    super.suffixIcononTap,
    super.controller,
    this.itens = defaultItens,
    this.width,
    super.key,
  });

  final List<DropdownMenuItem<String>> itens;
  final String? Function(String?)? validator;
  final double? width;

  static const List<DropdownMenuItem<String>> defaultItens = [];

  @override
  BaseInputState<DropdownUI> createState() => _DropdownUIState();

  static DropdownMenuItem<String> item({
    required String text,
    required String value,
  }) {
    return DropdownMenuItem<String>(
      value: value,
      child: TypographyUI(
        text,
        color: AppColors.black,
      )..body1,
    );
  }
}

class _DropdownUIState extends BaseInputState<DropdownUI> {
  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: FormBuilderDropdown(
        focusNode: focusNode,
        validator: widget.validator,
        isDense: false,
        name: widget.name,
        onChanged: widget.onChanged,
        initialValue: widget.initialValue,
        style: TextStyleFormUI.label,
        decoration: makeDecoration(),
        items: widget.itens,
        enabled: widget.enabled,
        dropdownColor: AppColors.backgroundColor,
      ),
    );
  }
}
