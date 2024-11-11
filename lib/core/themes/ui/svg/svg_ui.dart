import 'package:befocus/core/themes/ui/svg/base_svg_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// SvgUI é a abstração do widget svg
//ignore: must_be_immutable
class SvgUI extends BaseSvgUI {
  /// Construtor padrão
  SvgUI({
    this.size,
    super.key,
    this.color,
    this.isIcon = false,
    this.onTap,
  });

  /// size define a altura e largura
  final double? size;

  final Color? color;

  final bool isIcon;

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        path,
        width: isIcon ? 22 : MediaQuery.sizeOf(context).width * size!,
        height: isIcon ? 22 : MediaQuery.sizeOf(context).height * size!,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}
