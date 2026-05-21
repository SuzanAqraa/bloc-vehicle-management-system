import 'engine.dart';
import 'enums.dart';

abstract class Automobile {
  final String manufactureCompany;
  final DateTime manufactureDate;
  final String model;
  final Engine engine;
  final int plateNum;
  final GearType gearType;
  final int bodySerialNum;

  Automobile({
    required this.manufactureCompany,
    required this.manufactureDate,
    required this.model,
    required this.engine,
    required this.plateNum,
    required this.gearType,
    required this.bodySerialNum,
  });

  VehicleType get type;

  Map<String, dynamic> toJson() => {
    'manufactureCompany': manufactureCompany,
    'manufactureDate': manufactureDate.toIso8601String(),
    'model': model,
    'engine': engine.toJson(),
    'plateNum': plateNum,
    'gearType': gearType.name,
    'bodySerialNum': bodySerialNum,
  };
}