import 'package:befocus/core/core.dart';
import 'package:befocus/src/service/countdown_timer/bloc/countdown_cubit.dart';
import 'package:befocus/src/widgets/notes_content.dart';
import 'package:befocus/src/widgets/timer_initial_widget.dart';
import 'package:befocus/src/widgets/timer_paused_widget.dart';
import 'package:befocus/src/widgets/timer_started_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final cubit = Modular.get<CountDownCubit>();

  @override
  void dispose() {
    cubit.disposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: const DefaultAppBarUI(showRestartIcon: true),
      body: BlocBuilder<CountDownCubit, CountDownState>(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 16),
              FlutterStepIndicator(
                height: 20,
                list: const [1, 2, 3, 4],
                onChange: (i) {},
                page: cubit.lapCount,
                progressColor: AppColors.orangePrimary,
                negativeColor: AppColors.lightGrey200,
                positiveColor: AppColors.orangePrimary,
                positiveCheck: const SizedBox(),
              ),
              ...switch (state) {
                CountDownRunInProgress() => [
                    TimerStartedWidget(cubit: cubit),
                  ],
                CountDownRunPause() => [
                    TimerPausedWidget(cubit: cubit),
                  ],
                _ => [
                    TimerInitialWidget(cubit: cubit),
                  ]
              },
              const SizedBox(height: 40),
              const NotesContent(),
            ],
          );
        },
      ),
    );
  }
}
