import 'package:befocus/core/themes/ui/form/inputs/checkbox/base_checkbox_ui.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxUI extends BaseCheckBoxUI {
  CheckBoxUI({
    required super.name,
    required super.text,
    required super.onChanged,
    super.validator,
    super.enabled,
    super.onReset,
    super.secondary,
    super.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return checkboxButton;
  }
}
