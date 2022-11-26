import 'package:bloc/bloc.dart';
import 'package:bloc_project/services/api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/launches.dart';

part 'launch_event.dart';
part 'launch_state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final APIService _apiService;

  LaunchBloc(this._apiService) : super(LaunchLoadingState()) {
    on<LoadLaunchEvent>((event, emit) async {
      if (event is LoadLaunchEvent) {
        emit(LaunchLoadingState());
        try {
          final launches = await _apiService.getAllLaunches();
          emit(LaunchLoadedState(launches));
        } catch (e) {
          emit(LaunchErrorState(e.toString()));
        }
      }
    });
  }
}
