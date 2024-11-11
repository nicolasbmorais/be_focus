import 'package:befocus/core/themes/ui/image/base_image_ui.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageUI extends BaseImageUI {
  ImageUI({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  /// width define a largura
  final double? width;

  /// height define a altura
  final double? height;

//fit define o espaço que a imagem vai ocupar
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
