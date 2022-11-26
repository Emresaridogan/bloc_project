part of 'launch_bloc.dart';

@immutable
abstract class LaunchState extends Equatable {}

class LaunchLoadingState extends LaunchState {
  @override
  List<Object?> get props => [];
}

class LaunchLoadedState extends LaunchState {
  LaunchLoadedState(this.launches);
  List<Launches> launches;

  @override
  List<Object?> get props => [launches];
}

class LaunchErrorState extends LaunchState {
  LaunchErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
