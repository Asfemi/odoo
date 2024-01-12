part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

// New state for loading timers
final class TimerLoading extends TimerState {
  const TimerLoading() : super(0);

  @override
  String toString() => 'TimerLoading';
}

// New state for error
final class TimerError extends TimerState {
  final String error;

  const TimerError({required this.error}) : super(0);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'TimerError { error: $error }';
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

final class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}



final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}

class ProjectState extends TimerState {
  final String? selectedProject;

  const ProjectState({this.selectedProject}) : super(0);
}
class TaskState extends TimerState {
  final String? selectedTask;

  const TaskState( {this.selectedTask}) : super(0);
}