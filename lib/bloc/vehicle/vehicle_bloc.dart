import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/vehicle_repository.dart';
import '../../services/vehicle_api_service.dart';
import 'vehicle_event.dart';
import 'vehicle_state.dart';
import '../../models/motorcycle.dart';
import '../../models/car.dart';
import '../../models/truck.dart';
class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository repository;
  final VehicleApiService apiService;

  VehicleBloc({required this.repository, required this.apiService})
      : super(VehicleInitial()) {
    on<LoadVehiclesEvent>((event, emit) async {
      emit(VehicleLoading());
      try {
        final motorcycles = await apiService.fetchMotorcycles();
        final cars = await apiService.fetchCars();
        final trucks = await apiService.fetchTrucks();

        repository.motorcycles = motorcycles;
        repository.cars = cars;
        repository.trucks = trucks;

        emit(VehicleLoaded(
          motorcycles: motorcycles,
          cars: cars,
          trucks: trucks,
        ));
      } catch (e) {
        emit(VehicleError("Failed to load vehicles: $e"));
      }
    });

    on<AddVehicleEvent>((event, emit) async {
      try {
        final type = event.vehicle.type.name.toLowerCase(); // ✅ تم تعديل هنا
        await apiService.addVehicle(event.vehicle.toJson(), type);

        if (type == "motorcycle") repository.motorcycles.add(event.vehicle as Motorcycle);
        if (type == "car") repository.cars.add(event.vehicle as Car);
        if (type == "truck") repository.trucks.add(event.vehicle as Truck);

        emit(VehicleLoaded(
          motorcycles: repository.motorcycles,
          cars: repository.cars,
          trucks: repository.trucks,
        ));
      } catch (e) {
        emit(VehicleError("Failed to add vehicle: $e"));
      }
    });

    on<DeleteVehicleEvent>((event, emit) async {
      try {
        await apiService.deleteVehicle(event.plateNum, event.type.toLowerCase());

        if (event.type == "Motorcycle") {
          repository.motorcycles.removeWhere((v) => v.plateNum == event.plateNum);
        } else if (event.type == "Car") {
          repository.cars.removeWhere((v) => v.plateNum == event.plateNum);
        } else if (event.type == "Truck") {
          repository.trucks.removeWhere((v) => v.plateNum == event.plateNum);
        }

        emit(VehicleLoaded(
          motorcycles: repository.motorcycles,
          cars: repository.cars,
          trucks: repository.trucks,
        ));
      } catch (e) {
        emit(VehicleError("Failed to delete vehicle: $e"));
      }
    });
  }
}