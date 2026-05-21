// vehicle_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'vehicle_event.dart';
import 'vehicle_state.dart';
import '../../repository/vehicle_repository.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository repo;

  VehicleBloc(this.repo) : super(VehicleInitial()) {
    on<LoadVehiclesEvent>(_onLoad);
    on<AddCarEvent>(_onAddCar);
    on<AddTruckEvent>(_onAddTruck);
    on<AddMotorcycleEvent>(_onAddMotorcycle);
  }

  Future<void> _onLoad(
      LoadVehiclesEvent event,
      Emitter<VehicleState> emit,
      ) async {
    emit(VehicleLoading());
    try {
      await repo.load();
      _emitLoaded(emit);
    } catch (e) {
      emit(VehicleError("Failed to load vehicles: $e"));
    }
  }

  Future<void> _onAddCar(
      AddCarEvent event,
      Emitter<VehicleState> emit,
      ) async {
    // Preserve current state so UI doesn't flash on error
    final previous = state;
    try {
      await repo.addCar(event.car);
      _emitLoaded(emit); // repo lists are updated after add
    } catch (e) {
      emit(VehicleError("Failed to add car: $e"));
      emit(previous); // restore previous state
    }
  }

  Future<void> _onAddTruck(
      AddTruckEvent event,
      Emitter<VehicleState> emit,
      ) async {
    final previous = state;
    try {
      await repo.addTruck(event.truck);
      _emitLoaded(emit);
    } catch (e) {
      emit(VehicleError("Failed to add truck: $e"));
      emit(previous);
    }
  }

  Future<void> _onAddMotorcycle(
      AddMotorcycleEvent event,
      Emitter<VehicleState> emit,
      ) async {
    final previous = state;
    try {
      await repo.addMotorcycle(event.motorcycle);
      _emitLoaded(emit);
    } catch (e) {
      emit(VehicleError("Failed to add motorcycle: $e"));
      emit(previous);
    }
  }

  void _emitLoaded(Emitter<VehicleState> emit) {
    emit(VehicleLoaded(
      List.unmodifiable(repo.cars),
      List.unmodifiable(repo.trucks),
      List.unmodifiable(repo.motorcycles),
    ));
  }
}