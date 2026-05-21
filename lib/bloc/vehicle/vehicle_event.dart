// vehicle_event.dart
import '../../models/car.dart';
import '../../models/truck.dart';
import '../../models/motorcycle.dart';

abstract class VehicleEvent {}

class LoadVehiclesEvent extends VehicleEvent {}

// Use a sealed/union approach or separate typed events:
class AddCarEvent extends VehicleEvent {
  final Car car;
  AddCarEvent(this.car);
}

class AddTruckEvent extends VehicleEvent {
  final Truck truck;
  AddTruckEvent(this.truck);
}

class AddMotorcycleEvent extends VehicleEvent {
  final Motorcycle motorcycle;
  AddMotorcycleEvent(this.motorcycle);
}