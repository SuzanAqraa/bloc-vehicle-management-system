import '../../models/automobile.dart';

abstract class VehicleEvent {}

class LoadVehiclesEvent extends VehicleEvent {}

class AddVehicleEvent extends VehicleEvent {
  final Automobile vehicle;
  AddVehicleEvent(this.vehicle);
}

class DeleteVehicleEvent extends VehicleEvent {
  final int plateNum;
  DeleteVehicleEvent(this.plateNum);
}

class UpdateVehicleEvent extends VehicleEvent {
  final Automobile vehicle;
  UpdateVehicleEvent(this.vehicle);
}

class SaveVehiclesEvent extends VehicleEvent {}