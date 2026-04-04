import 'package:equatable/equatable.dart';
import '../../models/vehicle.dart';

abstract class VehicleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadVehiclesEvent extends VehicleEvent {}

class AddVehicleEvent extends VehicleEvent {
  final Vehicle vehicle;
  AddVehicleEvent(this.vehicle);

  @override
  List<Object?> get props => [vehicle];
}

class DeleteVehicleEvent extends VehicleEvent {
  final int plateNum;
  final String type;
  DeleteVehicleEvent({required this.plateNum, required this.type});

  @override
  List<Object?> get props => [plateNum, type];
}