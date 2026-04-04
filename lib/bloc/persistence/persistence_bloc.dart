import 'package:flutter_bloc/flutter_bloc.dart';
import 'persistence_event.dart';
import 'persistence_state.dart';


class PersistenceBloc extends Bloc<PersistenceEvent, PersistenceState> {
  PersistenceBloc() : super(PersistenceIdle()) {
    on<PersistLoadEvent>((event, emit) async {
      emit(PersistenceIdle());
    });

    on<PersistSaveEvent>((event, emit) async {
      emit(PersistenceSaving());
      try {
        await Future.delayed(Duration(seconds: 1));
        emit(PersistenceLoaded(null));
      } catch (e) {
        emit(PersistenceError(e.toString()));
      }
    });
  }
}