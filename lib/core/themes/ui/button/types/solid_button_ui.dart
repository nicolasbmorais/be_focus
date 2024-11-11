import 'package:flutter/material.dart';

class SolidButtonUI extends StatelessWidget {
  const SolidButtonUI({
    required this.height,
    required this.backgroundColor,
    this.onPressed,
    this.width,
    this.borderSide,
    this.prefixIcon,
    this.suffixIcon,
    super.key,
    this.body,
  });

  final double height;
  final Color backgroundColor;
  final void Function()? onPressed;
  final BorderSide? borderSide;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.only(left: 2),
        backgroundColor: backgroundColor,
        side: borderSide ?? BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Wrap(
            children: [
              if (prefixIcon != null) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: prefixIcon,
                ),
                const SizedBox(width: 8),
              ] else
                ...[],
              body ?? const SizedBox.shrink(),
              if (suffixIcon != null) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 7, left: 8),
                  child: suffixIcon,
                ),
              ] else
                ...[],
            ],
          ),
        ),
      ),
    );
  }
}
