import '../helpers/helpers.dart';
import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

class Motorcycle extends Automobile {
  final double tierDiameter;
  final double length;

  Motorcycle({
    required super.manufactureCompany,
    required super.manufactureDate,
    required super.model,
    required super.engine,
    required super.plateNum,
    required super.gearType,
    required super.bodySerialNum,
    required this.tierDiameter,
    required this.length,
  });

  @override
  VehicleType get type => VehicleType.motorcycle;

  factory Motorcycle.fromJson(Map<String, dynamic> json) {
    return Motorcycle(
      manufactureCompany: json['manufactureCompany'] ?? '',
      manufactureDate:
      DateTime.tryParse(json['manufactureDate'] ?? '') ?? DateTime.now(),
      model: json['model'] ?? '',
      engine: Engine.fromJson(json['engine'] ?? {}),
      plateNum: (json['plateNum'] ?? 0).toInt(),
      gearType: parseGearType(json['gearType']),
      bodySerialNum: (json['bodySerialNum'] ?? 0).toInt(),
      tierDiameter: (json['tierDiameter'] ?? 0).toDouble(),
      length: (json['length'] ?? 0).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'tierDiameter': tierDiameter,
    'length': length,
  };
}