import 'package:befocus/app/app_routing.dart';
import 'package:befocus/core/core.dart';
import 'package:befocus/src/controllers/settings/settings_cubit.dart';
import 'package:befocus/src/service/countdown_timer/countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TakeShortBreakPage extends StatefulWidget {
  const TakeShortBreakPage({super.key});

  @override
  State<TakeShortBreakPage> createState() => _TakeShortBreakPageState();
}

class _TakeShortBreakPageState extends State<TakeShortBreakPage> {
  StopWatchTimer stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countDown);

  @override
  void initState() {
    super.initState();
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromMinute(
        Modular.get<SettingsCubit>().settingsModel.shortBreak,
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
    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          TypographyUI('Restando', color: AppColors.blue)..subheading,
          const SizedBox(height: 8),
          StreamBuilder<int>(
            stream: stopWatchTimer.rawTime,
            initialData: stopWatchTimer.rawTime.value,
            builder: (context, state) {
              final displayTime = StopWatchTimer.getDisplayTime(
                state.data!,
                milliSecond: false,
              );
              return TypographyUI(displayTime, color: AppColors.blue)..h1Bold;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SvgUI(size: 0.55)..personStopped,
          ),
        ],
      ),
      bottomNavigationBar: ButtonUI(
        'Continue focando',
        onPressed: () {
          Modular.get<CountDownCubit>().resumeTimer();
          Modular.to.popUntil(ModalRoute.withName(AppRouting.timerPage));
        },
      )..outlined,
    );
  }
}
