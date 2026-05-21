import '../helpers/helpers.dart';
import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

class Truck extends Automobile {
  final double freeWeight;
  final double fullWeight;
  final double length;
  final double width;
  final String color;

  Truck({
    required super.manufactureCompany,
    required super.manufactureDate,
    required super.model,
    required super.engine,
    required super.plateNum,
    required super.gearType,
    required super.bodySerialNum,
    required this.freeWeight,
    required this.fullWeight,
    required this.length,
    required this.width,
    required this.color,
  });

  @override
  VehicleType get type => VehicleType.truck;

  factory Truck.fromJson(Map<String, dynamic> json) {
    return Truck(
      manufactureCompany: json['manufactureCompany'] ?? '',
      manufactureDate:
      DateTime.tryParse(json['manufactureDate'] ?? '') ?? DateTime.now(),
      model: json['model'] ?? '',
      engine: Engine.fromJson(json['engine'] ?? {}),
      plateNum: (json['plateNum'] ?? 0).toInt(),
      gearType: parseGearType(json['gearType']),
      bodySerialNum: (json['bodySerialNum'] ?? 0).toInt(),
      freeWeight: (json['freeWeight'] ?? 0).toDouble(),
      fullWeight: (json['fullWeight'] ?? 0).toDouble(),
      length: (json['length'] ?? 0).toDouble(),
      width: (json['width'] ?? 0).toDouble(),
      color: json['color'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'freeWeight': freeWeight,
    'fullWeight': fullWeight,
    'length': length,
    'width': width,
    'color': color,
  };
}