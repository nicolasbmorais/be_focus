// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

/// BaseSvgUI é a base do SvgUI
//ignore: must_be_immutable
abstract class BaseSvgUI extends StatelessWidget {
  /// Construtor padrão
  BaseSvgUI({super.key});

  /// Caminho do SVG a ser usado pelo SvgUI
  late String path;

  String _makeFullPath(String svg) {
    return 'assets/svg/$svg.svg';
  }

  // Logo
  void get logo => path = _makeFullPath('logo/logo');

  /// App Assets
  ///
  void get personAttention => path = _makeFullPath('persons/person_attention');

  void get personIntroduction =>
      path = _makeFullPath('persons/person_introduction');

  void get personLongBreak => path = _makeFullPath('persons/person_long_break');

  void get personShortBreak =>
      path = _makeFullPath('persons/person_short_break');

  void get personStopped => path = _makeFullPath('persons/person_stopped');

  //Icons
  void get arrowBack => path = _makeFullPath('icons/arrow_back');

  void get arrowForward => path = _makeFullPath('icons/arrow_forward');

  void get caretDown => path = _makeFullPath('icons/caret_down');

  void get done => path = _makeFullPath('icons/done');

  void get restart => path = _makeFullPath('icons/restart');

  void get settings => path = _makeFullPath('icons/settings');

  void get viewMore => path = _makeFullPath('icons/view_more');

  void get edit => path = _makeFullPath('icons/edit');

  void get delete => path = _makeFullPath('icons/delete');
}
