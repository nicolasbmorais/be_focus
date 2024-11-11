part of 'countdown_cubit.dart';

sealed class CountDownState extends Equatable {
  const CountDownState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

final class CountDownInitial extends CountDownState {
  const CountDownInitial(super.duration);
}

final class CountDownRunPause extends CountDownState {
  const CountDownRunPause(super.duration);
}

final class CountDownRunInProgress extends CountDownState {
  const CountDownRunInProgress(super.duration);
}

final class CountDownRunComplete extends CountDownState {
  const CountDownRunComplete(super.duration);
}
