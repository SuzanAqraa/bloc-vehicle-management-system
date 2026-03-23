import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/car.dart';
import '../../models/truck.dart';
import '../../models/motorcycle.dart';
import '../../repository/vehicle_repository.dart';
import 'vehicle_event.dart';
import 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository repo;

  VehicleBloc(this.repo) : super(VehicleInitial()) {
    on<LoadVehiclesEvent>((event, emit) async {
      emit(VehicleLoading());
      await repo.load();
      emit(VehicleLoaded(repo.cars, repo.trucks, repo.motorcycles));
    });

    on<AddVehicleEvent>((event, emit) {
      if (event.vehicle is Car) repo.cars.add(event.vehicle as Car);
      if (event.vehicle is Truck) repo.trucks.add(event.vehicle as Truck);
      if (event.vehicle is Motorcycle)
        repo.motorcycles.add(event.vehicle as Motorcycle);

      emit(VehicleLoaded(repo.cars, repo.trucks, repo.motorcycles));
    });

    on<DeleteVehicleEvent>((event, emit) {
      repo.cars.removeWhere((e) => e.plateNum == event.plateNum);
      repo.trucks.removeWhere((e) => e.plateNum == event.plateNum);
      repo.motorcycles.removeWhere((e) => e.plateNum == event.plateNum);

      emit(VehicleLoaded(repo.cars, repo.trucks, repo.motorcycles));
    });

    on<SaveVehiclesEvent>((event, emit) async {
      await repo.save();
    });
  }
}