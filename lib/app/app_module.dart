import 'package:befocus/app/app_routing.dart';
import 'package:befocus/src/controllers/home/home_cubit.dart';
import 'package:befocus/src/controllers/notes/notes_cubit.dart';
import 'package:befocus/src/controllers/settings/settings_cubit.dart';
import 'package:befocus/src/service/countdown_timer/bloc/countdown_cubit.dart';
import 'package:befocus/src/service/countdown_timer/ticker.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addSingleton<Ticker>(Ticker.new)
      ..addSingleton<NotesCubit>(NotesCubit.new)
      ..addSingleton<SettingsCubit>(SettingsCubit.new)
      ..addSingleton<CountDownCubit>(CountDownCubit.new)
      ..addSingleton<HomeCubit>(HomeCubit.new);
  }

  @override
  void routes(RouteManager r) => AppRouting.routes(r);
}
