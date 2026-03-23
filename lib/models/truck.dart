import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

class Truck extends Automobile {
  double freeWeight;
  double fullWeight;

  Truck(
      super.manufactureCompany,
      super.manufactureDate,
      super.model,
      super.engine,
      super.plateNum,
      super.gearType,
      super.bodySerialNum,
      this.freeWeight,
      this.fullWeight,
      );

  Map<String, dynamic> toJson() => {
    ...baseJson(),
    'type': 'truck',
    'freeWeight': freeWeight,
    'fullWeight': fullWeight,
  };

  factory Truck.fromJson(Map<String, dynamic> json) {
    return Truck(
      json['manufactureCompany'],
      DateTime.parse(json['manufactureDate']),
      json['model'],
      Engine.fromJson(json['engine']),
      json['plateNum'],
      GearType.values.firstWhere((e) => e.name == json['gearType']),
      json['bodySerialNum'],
      (json['freeWeight']).toDouble(),
      (json['fullWeight']).toDouble(),
    );
  }
}