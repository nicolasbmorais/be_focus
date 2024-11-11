import 'package:befocus/core/core.dart';
import 'package:befocus/core/themes/ui/form/inputs/text_style_form_ui.dart';
import 'package:flutter/material.dart';

class BaseInput extends StatefulWidget {
  const BaseInput({
    required this.name,
    required this.hintText,
    super.key,
    this.initialValue,
    this.label,
    this.suffixIcon,
    this.suffixIcononTap,
    this.controller,
    this.enabled = true,
    this.paddingBottom = 0,
    this.minLines,
    this.maxLines,
    this.customFillColor,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
  });

  final String name;
  final String hintText;
  final String? initialValue;
  final String? label;
  final IconData? suffixIcon;
  final void Function()? suffixIcononTap;
  final TextEditingController? controller;
  final bool enabled;
  final void Function()? onTap;
  final double paddingBottom;
  final int? minLines;
  final int? maxLines;
  final Color? customFillColor;
  final void Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSubmitted;
  final TextInputType? keyboardType;

  @override
  BaseInputState createState() => BaseInputState();
}

class BaseInputState<T extends BaseInput> extends State<T> {
  final focusNode = FocusNode();
  TextEditingController? controller;
  double iconSize = 16;
  bool hasFocus = false;

  InputDecoration makeDecoration() {
    return InputDecoration(
      counterText: '',
      labelText: widget.label,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: widget.hintText,
      labelStyle: TextStyleFormUI.label,
      hintStyle: TextStyleFormUI.label,
      errorStyle: TextStyleFormUI.errorLabel,
      floatingLabelStyle: TextStyleFormUI.boldLabel,
      filled: true,
      fillColor: AppColors.backgroundColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      focusedBorder: const UnderlineInputBorder(),
      disabledBorder: const UnderlineInputBorder(),
      errorBorder: const UnderlineInputBorder(),
      focusedErrorBorder: const UnderlineInputBorder(),
      errorMaxLines: 2,
    );
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
