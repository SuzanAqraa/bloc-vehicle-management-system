import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

abstract class Vehicle extends Automobile {
  final double length;
  final double width;
  final String color;

  Vehicle({
    required super.manufactureCompany,
    required super.manufactureDate,
    required super.model,
    required super.engine,
    required super.plateNum,
    required super.gearType,
    required super.bodySerialNum,
    required this.length,
    required this.width,
    required this.color,
  });

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'length': length,
    'width': width,
    'color': color,
  };
}