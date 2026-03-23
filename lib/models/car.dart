import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

class Car extends Automobile {
  int chairNum;
  bool isFurnitureLeather;

  Car(
      super.manufactureCompany,
      super.manufactureDate,
      super.model,
      super.engine,
      super.plateNum,
      super.gearType,
      super.bodySerialNum,
      this.chairNum,
      this.isFurnitureLeather,
      );

  Map<String, dynamic> toJson() => {
    ...baseJson(),
    'type': 'car',
    'chairNum': chairNum,
    'isFurnitureLeather': isFurnitureLeather,
  };

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      json['manufactureCompany'],
      DateTime.parse(json['manufactureDate']),
      json['model'],
      Engine.fromJson(json['engine']),
      json['plateNum'],
      GearType.values.firstWhere((e) => e.name == json['gearType']),
      json['bodySerialNum'],
      json['chairNum'],
      json['isFurnitureLeather'],
    );
  }
}