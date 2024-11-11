import 'package:befocus/app/app_routing.dart';
import 'package:befocus/core/core.dart';
import 'package:befocus/src/service/countdown_timer/countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PauseButtons extends StatelessWidget {
  const PauseButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<CountDownCubit>();

    return Row(
      children: [
        ButtonUI(
          'Pausa curta',
          isExpanded: true,
          background: AppColors.black,
          onPressed: () {
            cubit.pauseTimer();
            Modular.to.pushNamed(AppRouting.shortBreakInfoPage);
          },
        )..outlined,
        const SizedBox(width: 12),
        ButtonUI(
          'Pausa longa',
          isExpanded: true,
          background: AppColors.black,
          onPressed: () {
            cubit.pauseTimer();
            Modular.to.pushNamed(AppRouting.longBreakPage);
          },
        )..outlined,
      ],
    );
  }
}
