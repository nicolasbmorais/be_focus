import 'package:befocus/app/app_routing.dart';
import 'package:befocus/core/core.dart';
import 'package:befocus/src/controllers/settings/settings_cubit.dart';
import 'package:befocus/src/service/countdown_timer/bloc/countdown_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TakeLongBreakPage extends StatefulWidget {
  const TakeLongBreakPage({super.key});

  @override
  State<TakeLongBreakPage> createState() => _TakeLongBreakPageState();
}

class _TakeLongBreakPageState extends State<TakeLongBreakPage> {
  final settingsCubit = Modular.get<SettingsCubit>();

  StopWatchTimer stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countDown);

  @override
  void initState() {
    super.initState();
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromMinute(
        settingsCubit.settingsModel.longBreak,
      ),
    );

    stopWatchTimer.onStartTimer();
  }

  @override
  void dispose() {
    super.dispose();
    stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<CountDownCubit>();

    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 16),
            child: TypographyUI('Faça uma pausa longa')..h2Bold,
          ),
          TypographyUI('Parabéns pelo bom trabalho!')..body1,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: SvgUI(size: 0.55)..personLongBreak,
          ),
          const SizedBox(height: 35),
          if (settingsCubit.settingsModel.restartAutomatically)
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypographyUI('Reiniciando o ciclo pomodoro em ')..body1,
                  StreamBuilder<int>(
                    stream: stopWatchTimer.rawTime,
                    initialData: stopWatchTimer.rawTime.value,
                    builder: (context, state) {
                      final displayTime = int.tryParse(
                        StopWatchTimer.getDisplayTime(
                          state.data!,
                          hours: false,
                          second: false,
                          milliSecond: false,
                        ),
                      );
                      return TypographyUI('$displayTime minutos...')..body1;
                    },
                  ),
                ],
              ),
            )
          else
            GestureDetector(
              onTap: () {
                cubit.resetTimer();
                Modular.to.popUntil(ModalRoute.withName(AppRouting.timerPage));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgUI(isIcon: true)..restart,
                  const SizedBox(width: 8),
                  TypographyUI('Reiniciar o ciclo pomodoro')..body1,
                ],
              ),
            ),
        ],
      ),
    );
  }
}
