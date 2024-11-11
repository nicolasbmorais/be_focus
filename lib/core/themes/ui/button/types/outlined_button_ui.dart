import 'package:flutter/material.dart';

class OutlinedButtonUI extends StatelessWidget {
  const OutlinedButtonUI({
    required this.height,
    required this.borderSideColor,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    super.key,
    this.body,
  });

  final double height;
  final double? width;
  final Color borderSideColor;
  final void Function()? onPressed;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: borderSideColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null) ...[
                prefixIcon!,
                const SizedBox(width: 8),
              ],
              body ?? const SizedBox.shrink(),
              if (suffixIcon != null) ...[
                const SizedBox(width: 8),
                suffixIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
