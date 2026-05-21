// vehicle_state.dart — add copyWith for convenience
import '../../models/car.dart';
import '../../models/truck.dart';
import '../../models/motorcycle.dart';

abstract class VehicleState {}

class VehicleInitial extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehicleLoaded extends VehicleState {
  final List<Car> cars;
  final List<Truck> trucks;
  final List<Motorcycle> motorcycles;

  VehicleLoaded(this.cars, this.trucks, this.motorcycles);

  int get total => cars.length + trucks.length + motorcycles.length;

  VehicleLoaded copyWith({
    List<Car>? cars,
    List<Truck>? trucks,
    List<Motorcycle>? motorcycles,
  }) {
    return VehicleLoaded(
      cars ?? this.cars,
      trucks ?? this.trucks,
      motorcycles ?? this.motorcycles,
    );
  }
}

class VehicleError extends VehicleState {
  final String message;
  VehicleError(this.message);
}