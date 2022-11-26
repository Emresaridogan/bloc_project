part of 'launch_bloc.dart';

@immutable
abstract class LaunchEvent extends Equatable {
  const LaunchEvent();
}

class LoadLaunchEvent extends LaunchEvent {
  @override
  List<Object?> get props => [];
}
