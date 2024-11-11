import 'package:befocus/app/app_routing.dart';
import 'package:befocus/core/core.dart';
import 'package:befocus/src/service/countdown_timer/bloc/countdown_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TakeShortInfoBreakPage extends StatelessWidget {
  const TakeShortInfoBreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lapCountN = Modular.get<CountDownCubit>().lapCountN;

    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          TypographyUI('Faça uma pausa curta')..h2Bold,
          const SizedBox(height: 16),
          TypographyUI(
            'Faltam $lapCountN ciclos Pomodoro. Bom trabalho!',
          )..body1,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Container(child: SvgUI(size: 0.55)..personShortBreak),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonUI(
            'Comece um pequeno intervalo',
            background: AppColors.blue,
            onPressed: () => Modular.to.pushNamed(AppRouting.shortBreakPage),
          )..solid,
          const SizedBox(height: 12),
          Row(
            children: [
              ButtonUI(
                'Voltar',
                isExpanded: true,
                background: AppColors.black,
                onPressed: () => Modular.to.pop(),
              )..outlined,
              const SizedBox(width: 12),
              ButtonUI(
                'Pausa longa',
                isExpanded: true,
                background: AppColors.black,
                onPressed: () => Modular.to.pushNamed(AppRouting.longBreakPage),
              )..outlined,
            ],
          ),
        ],
      ),
    );
  }
}
