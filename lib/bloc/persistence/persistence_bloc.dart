import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/storage_service.dart';

import 'persistence_event.dart';
import 'persistence_state.dart';

class PersistenceBloc extends Bloc<PersistenceEvent, PersistenceState> {
  final StorageService storage;

  PersistenceBloc(this.storage) : super(PersistenceIdle()) {
    on<LoadCacheEvent>(_onLoad);
    on<SaveCacheEvent>(_onSave);
  }

  // 📥 LOAD FROM LOCAL STORAGE
  Future<void> _onLoad(
      LoadCacheEvent event, Emitter<PersistenceState> emit) async {
    try {
      emit(PersistenceLoading());

      final data = await storage.loadVehicles(); // ✅ correct method

      emit(PersistenceLoaded(data));
    } catch (e) {
      emit(PersistenceError("Failed to load cached data"));
    }
  }

  // 💾 SAVE TO LOCAL STORAGE
  Future<void> _onSave(
      SaveCacheEvent event, Emitter<PersistenceState> emit) async {
    try {
      emit(PersistenceLoading());

      // ⚠️ هون لازم تمرري البيانات الفعلية من Repository لاحقًا
      await storage.saveVehicles({
        "cars": [],
        "trucks": [],
        "motorcycles": [],
      });

      emit(PersistenceIdle());
    } catch (e) {
      emit(PersistenceError("Failed to save cached data"));
    }
  }
}