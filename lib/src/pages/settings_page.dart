import 'package:befocus/core/core.dart';
import 'package:befocus/core/themes/ui/form/inputs/checkbox/checkbox_ui.dart';
import 'package:befocus/core/themes/ui/form/inputs/dropdown/dropdown_ui.dart';
import 'package:befocus/src/controllers/settings/settings_cubit.dart';
import 'package:befocus/src/service/countdown_timer/bloc/countdown_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final cubit = Modular.get<SettingsCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      bloc: cubit,
      builder: (context, state) {
        return TemplateUI(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.backgroundColor,
            title: TypographyUI('Configurações')..h3Bold,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldUI(
                  name: 'focusDuration',
                  hintText: '',
                  label: 'Duração do Pomodoro em minutos',
                  initialValue: cubit.settingsModel.focusDuration.toString(),
                  keyboardType: TextInputType.number,
                  textInputFormatter: [
                    LengthLimitingTextInputFormatter(2),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    cubit.focusDuration = int.tryParse(value!);
                  },
                ),
                const SizedBox(height: 24),
                TextFieldUI(
                  name: 'shortBreak',
                  hintText: '',
                  label: 'Duração do intervalo curto em minutos',
                  initialValue: cubit.settingsModel.shortBreak.toString(),
                  keyboardType: TextInputType.number,
                  textInputFormatter: [
                    LengthLimitingTextInputFormatter(2),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    cubit.shortBreak = int.tryParse(value!);
                  },
                ),
                const SizedBox(height: 24),
                TextFieldUI(
                  name: 'longBreak',
                  hintText: '',
                  label: 'Duração do intervalo longo em minutos',
                  initialValue: cubit.settingsModel.longBreak.toString(),
                  keyboardType: TextInputType.number,
                  textInputFormatter: [
                    LengthLimitingTextInputFormatter(2),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    cubit.longBreak = int.tryParse(value!);
                  },
                ),
                const SizedBox(height: 24),
                DropdownUI(
                  name: 'timer',
                  label: 'Som do temporizador',
                  hintText: '',
                  initialValue: cubit.settingsModel.timerSound,
                  width: double.infinity,
                  onChanged: (sound) => cubit.timeSoundName = sound,
                  validator: (value) {
                    return null;
                  },
                  itens: [
                    DropdownUI.item(
                      value: 'Bip Alarm',
                      text: 'Bip Alarm',
                    ),
                    DropdownUI.item(
                      value: 'Clock Alarm',
                      text: 'Clock Alarm',
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                CheckBoxUI(
                  name: 'showCompleteNotification',
                  text: 'Mostrar notificação quando concluído',
                  initialValue: cubit.settingsModel.showCompleteNotification,
                  onChanged: (val) {
                    cubit.showCompleteNotification = val ?? false;
                  },
                )..checkboxDefault,
                CheckBoxUI(
                  name: 'restartAutomatically',
                  text: 'Reiniciar automaticamente',
                  initialValue: cubit.settingsModel.restartAutomatically,
                  onChanged: (val) {
                    cubit.restartAutomatically = val ?? false;
                  },
                )..checkboxDefault,
              ],
            ),
          ),
          bottomNavigationBar: ButtonUI(
            '',
            body: TypographyUI(
              state is SettingsLoading ? 'Salvando...' : 'Salvar',
              color: state is SettingsLoading ? Colors.white70 : Colors.white,
            )..body1,
            onPressed: () async {
              await cubit.applyPreferences();
              Modular.get<CountDownCubit>().resetTimer();
            },
          )..solid,
        );
      },
    );
  }
}
