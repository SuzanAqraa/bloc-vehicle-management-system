import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/vehicle_repository.dart';
import 'persistence_event.dart';
import 'persistence_state.dart';

class PersistenceBloc extends Bloc<PersistenceEvent, PersistenceState> {
  final VehicleRepository repo;

  PersistenceBloc(this.repo) : super(PersistenceIdle()) {
    on<PersistSaveEvent>((event, emit) async {
      emit(PersistenceSaving());
      try {
        await repo.save();
        emit(PersistenceIdle());
      } catch (e) {
        emit(PersistenceError(e.toString()));
      }
    });

    on<PersistLoadEvent>((event, emit) async {
      try {
        await repo.load();
        emit(PersistenceLoaded());
      } catch (e) {
        emit(PersistenceError(e.toString()));
      }
    });
  }
}