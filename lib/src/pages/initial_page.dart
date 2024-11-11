import 'package:befocus/app/app_routing.dart';
import 'package:befocus/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      body: Column(
        children: [
          TypographyUI('Comece a focar')..h2Bold,
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SvgUI(size: 0.55)..personIntroduction,
          ),
        ],
      ),
      bottomNavigationBar: ButtonUI(
        'Iniciar ciclo pomodoro',
        onPressed: () => Modular.to.pushNamed(AppRouting.timerPage),
      )..solid,
    );
  }
}
