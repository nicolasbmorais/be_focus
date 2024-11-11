import 'package:flutter/material.dart';

/// Base para o TypographyUI
//ignore: must_be_immutable
abstract class BaseTypographyUI extends StatelessWidget {
  /// Construtor padrão
  BaseTypographyUI({super.key});

  /// fontWeight define o peso da fonte
  FontWeight fontWeight = FontWeight.w400;

  /// fontSize define o tamanho da fonte
  double fontSize = 16;

  /// fontHeight define a altura da fonte
  double fontHeight = 22;

  /// fontWeight define tipo de fonte
  String fontFamily = 'Roboto';

  /// escolhe a fonte
  void get h1 {
    fontWeight = FontWeight.w300;
    fontSize = 40;
    fontHeight = 54 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get h2 {
    fontWeight = FontWeight.w300;
    fontSize = 32;
    fontHeight = 34 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get h3 {
    fontWeight = FontWeight.w300;
    fontSize = 24;
    fontHeight = 28 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get h1Bold {
    fontWeight = FontWeight.w900;
    fontSize = 40;
    fontHeight = 42 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get h2Bold {
    fontWeight = FontWeight.w900;
    fontSize = 32;
    fontHeight = 34 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get h3Bold {
    fontWeight = FontWeight.w900;
    fontSize = 24;
    fontHeight = 28 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get title {
    fontWeight = FontWeight.w500;
    fontSize = 20;
    fontHeight = 28 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get subheading {
    fontWeight = FontWeight.w500;
    fontSize = 18;
    fontHeight = 26 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get body1 {
    fontWeight = FontWeight.w400;
    fontSize = 16;
    fontHeight = 28 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get body2 {
    fontWeight = FontWeight.w300;
    fontSize = 14;
    fontHeight = 24 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get titleBold {
    fontWeight = FontWeight.w700;
    fontSize = 20;
    fontHeight = 28 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get subHeadingBold {
    fontWeight = FontWeight.w800;
    fontSize = 18;
    fontHeight = 26 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get body1Bold {
    fontWeight = FontWeight.w800;
    fontSize = 16;
    fontHeight = 28 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get body2Bold {
    fontWeight = FontWeight.w800;
    fontSize = 14;
    fontHeight = 24 / fontSize;
    fontFamily = 'Roboto';
  }

  /// escolhe a fonte
  void get caption {
    fontWeight = FontWeight.w300;
    fontSize = 16;
    fontHeight = 22 / fontSize;
    fontFamily = 'Roboto';
  }
}
