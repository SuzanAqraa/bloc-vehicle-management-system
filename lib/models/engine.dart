import '../helpers/helpers.dart';
import 'enums.dart';

class Engine {
  final String manufacture;
  final DateTime manufactureDate;
  final String model;
  final double capacity;
  final int cylinders;
  final FuelType fuelType;

  Engine({
    required this.manufacture,
    required this.manufactureDate,
    required this.model,
    required this.capacity,
    required this.cylinders,
    required this.fuelType,
  });

  factory Engine.fromJson(Map<String, dynamic> json) {
    return Engine(
      manufacture: json['manufacture'] ?? '',
      manufactureDate: DateTime.tryParse(json['manufactureDate'] ?? '') ??
          DateTime.now(),
      model: json['model'] ?? '',
      capacity: (json['capacity'] ?? 0).toDouble(),
      cylinders: (json['cylinders'] ?? 0).toInt(),
      fuelType: parseFuelType(json['fuelType']),
    );
  }

  Map<String, dynamic> toJson() => {
    'manufacture': manufacture,
    'manufactureDate': manufactureDate.toIso8601String(),
    'model': model,
    'capacity': capacity,
    'cylinders': cylinders,
    'fuelType': fuelType.name,
  };
}