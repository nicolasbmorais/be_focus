import 'package:flutter/material.dart';

/// Classe de cores do app
class AppColors {
//Default colors
  /// Construtor privado para impedir instanciação
  static Color get backgroundColor => const Color(0xFFFFFFFF);

  /// Construtor privado para impedir instanciação
  static Color get orangePrimary => const Color(0xFFD45735);

  /// Construtor privado para impedir instanciação
  static Color get greyDefault => const Color(0xFF8C8C8C);

  /// Construtor privado para impedir instanciação
  static Color get lightGrey100 => const Color(0xFFF1F1F1);

  /// Construtor privado para impedir instanciação
  static Color get lightGrey200 => const Color(0xFFD8D1D1);

  /// Construtor privado para impedir instanciação
  static Color get black => const Color(0xFF232323);

  /// Construtor privado para impedir instanciação
  static Color get transparent => const Color(0x00000000);

  /// Construtor privado para impedir instanciação
  static Color get dangerSystem => const Color(0xFFFF0000);

  /// Construtor privado para impedir instanciação
  static Color get green => const Color(0xFF019E40);

  /// Construtor privado para impedir instanciação
  static Color get blue => const Color(0xFF1B83E3);

//Buttons
  static Color get enabledBorderButton => const Color(0xFFD8DADF);

  /// Construtor privado para impedir instanciação
  static MaterialColor get primarySwatch => const MaterialColor(
        0xFFD45735,
        <int, Color>{
          50: Color.fromRGBO(212, 87, 53, .1),
          100: Color.fromRGBO(212, 87, 53, .2),
          200: Color.fromRGBO(212, 87, 53, .3),
          300: Color.fromRGBO(212, 87, 53, .4),
          400: Color.fromRGBO(212, 87, 53, .5),
          500: Color.fromRGBO(212, 87, 53, .6),
          600: Color.fromRGBO(212, 87, 53, .7),
          700: Color.fromRGBO(212, 87, 53, .8),
          800: Color.fromRGBO(212, 87, 53, .9),
          900: Color.fromRGBO(212, 87, 53, 1),
        },
      );
}
