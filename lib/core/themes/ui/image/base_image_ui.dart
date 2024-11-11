import 'package:flutter/material.dart';

// ignore: must_be_immutable
abstract class BaseImageUI extends StatelessWidget {
  BaseImageUI({super.key});

  late String path;

  String _makeFullPath(String image) {
    return 'assets/images/$image.png';
  }

  //Welcome Carrousel
  void get welcomeCarrousel1 => path = _makeFullPath('onboarding-carrousel-01');

  void get welcomeCarrousel2 => path = _makeFullPath('onboarding-carrousel-02');

  void get welcomeCarrousel3 => path = _makeFullPath('onboarding-carrousel-03');

  void get welcomeCarrousel4 => path = _makeFullPath('onboarding-carrousel-04');

  void get imageTemporaria => path = _makeFullPath('home-learning-center');

  void get homeAdversiting => path = _makeFullPath('home-adversiting');

  // unico

  void get cnhImage => path = _makeFullPath('documents/cnh');

  void get codigoImage => path = _makeFullPath('documents/codigo');

  void get validadeImage => path = _makeFullPath('documents/validade');

  void get dataEmissaoImage => path = _makeFullPath('documents/data_emissao');

  void get orgaoEmissorImage => path = _makeFullPath('documents/orgao_emissor');

  void get rgImage => path = _makeFullPath('documents/rg');

  void get dataExpedicaoImage =>
      path = _makeFullPath('documents/data_expedicao');

  void get estadoImage => path = _makeFullPath('documents/estado');

  void get orgaoExpedidorImage =>
      path = _makeFullPath('documents/orgao_expedidor');
}
