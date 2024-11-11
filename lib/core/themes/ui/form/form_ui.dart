import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormUI extends StatelessWidget {
  const FormUI({
    required this.formKey,
    required this.child,
    super.key,
    this.initialValue,
    this.onChange,
  });

  final GlobalKey<FormBuilderState> formKey;
  final Widget child;
  final Map<String, dynamic>? initialValue;
  final void Function()? onChange;

  static GlobalKey<FormBuilderState> get generateKey =>
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      initialValue: initialValue ?? {},
      onChanged: onChange,
      child: child,
    );
  }
}
