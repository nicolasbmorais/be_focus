import 'package:befocus/core/themes/app_colors.dart';
import 'package:befocus/core/themes/ui/typography/base_typography_ui.dart';
import 'package:flutter/material.dart';

/// Textos padrões do projeto
//ignore: must_be_immutable
class TypographyUI extends BaseTypographyUI {
  /// Construtor padrão
  TypographyUI(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.height,
    this.textOverflow,
    this.maxLines,
    this.withUnderLine = false,
  });

  /// text: define o texto a ser exibido
  final String text;

  /// color: define a cor
  final Color? color;

  /// textAlign: define o alinhamento
  final TextAlign? textAlign;

  /// height: define a altura
  final double? height;

  /// textOverflow: define o tipo de vazamento de texto
  final TextOverflow? textOverflow;

  /// maxLines: Quantidades de linhas máximas
  final int? maxLines;

  final bool withUnderLine;

  Color _makeColor() {
    if (withUnderLine) {
      return Colors.transparent;
    }

    return color ?? AppColors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: height ?? fontHeight,
        color: _makeColor(),
        fontFamily: fontFamily,
        decoration: withUnderLine ? TextDecoration.underline : null,
        decorationColor: withUnderLine ? AppColors.backgroundColor : null,
        decorationThickness: withUnderLine ? 1 : null,
        shadows: withUnderLine
            ? [
                Shadow(
                  color: AppColors.backgroundColor,
                  offset: const Offset(0, -10),
                ),
              ]
            : null,
      ),
    );
  }
}
