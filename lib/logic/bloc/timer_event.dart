part of 'timer_bloc.dart';

sealed class TimerEvent {
  const TimerEvent();
}

final class TimerLoaded extends TimerState {
  final List<TimersData> content;

  const TimerLoaded(this.content, int duration) : super(duration);

  @override
  List<Object> get props => [content, duration];

  @override
  String toString() => 'TimerLoaded { content: $content, duration: $duration }';
}


final class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}
