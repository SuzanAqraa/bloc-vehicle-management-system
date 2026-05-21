import '../helpers/helpers.dart';
import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

class Car extends Automobile {
  final int chairNum;
  final bool isFurnitureLeather;
  final double length;
  final double width;
  final String color;

  Car({
    required super.manufactureCompany,
    required super.manufactureDate,
    required super.model,
    required super.engine,
    required super.plateNum,
    required super.gearType,
    required super.bodySerialNum,
    required this.chairNum,
    required this.isFurnitureLeather,
    required this.length,
    required this.width,
    required this.color,
  });

  @override
  VehicleType get type => VehicleType.car;

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      manufactureCompany: json['manufactureCompany'] ?? '',
      manufactureDate:
      DateTime.tryParse(json['manufactureDate'] ?? '') ?? DateTime.now(),
      model: json['model'] ?? '',
      engine: Engine.fromJson(json['engine'] ?? {}),
      plateNum: (json['plateNum'] ?? 0).toInt(),
      gearType: parseGearType(json['gearType']),
      bodySerialNum: (json['bodySerialNum'] ?? 0).toInt(),
      chairNum: (json['chairNum'] ?? 0).toInt(),
      isFurnitureLeather: json['isFurnitureLeather'] ?? false,
      length: (json['length'] ?? 0).toDouble(),
      width: (json['width'] ?? 0).toDouble(),
      color: json['color'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'chairNum': chairNum,
    'isFurnitureLeather': isFurnitureLeather,
    'length': length,
    'width': width,
    'color': color,
  };
}