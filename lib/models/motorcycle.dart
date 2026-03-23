import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

class Motorcycle extends Automobile {
  double tierDiameter;
  double length;

  Motorcycle(
      super.manufactureCompany,
      super.manufactureDate,
      super.model,
      super.engine,
      super.plateNum,
      super.gearType,
      super.bodySerialNum,
      this.tierDiameter,
      this.length,
      );

  Map<String, dynamic> toJson() => {
    ...baseJson(),
    'type': 'motorcycle',
    'tierDiameter': tierDiameter,
    'length': length,
  };

  factory Motorcycle.fromJson(Map<String, dynamic> json) {
    return Motorcycle(
      json['manufactureCompany'],
      DateTime.parse(json['manufactureDate']),
      json['model'],
      Engine.fromJson(json['engine']),
      json['plateNum'],
      GearType.values.firstWhere((e) => e.name == json['gearType']),
      json['bodySerialNum'],
      (json['tierDiameter']).toDouble(),
      (json['length']).toDouble(),
    );
  }
}