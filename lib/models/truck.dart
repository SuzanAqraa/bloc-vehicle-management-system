import 'vehicle.dart';
import 'engine.dart';
import 'enums.dart';

class Truck extends Vehicle {
  double _freeWeight;
  double _fullWeight;

  Truck(
      String manufactureCompany,
      DateTime manufactureDate,
      String model,
      Engine engine,
      int plateNum,
      GearType gearType,
      int bodySerialNum,
      int length,
      int width,
      String color,
      this._freeWeight,
      this._fullWeight)
      : super(manufactureCompany, manufactureDate, model, engine, plateNum,
      gearType, bodySerialNum, length, width, color);

  double get freeWeight => _freeWeight;
  set freeWeight(double val) => _freeWeight = val;

  double get fullWeight => _fullWeight;
  set fullWeight(double val) => _fullWeight = val;

  @override
  VehicleType get type => VehicleType.truck;

  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'freeWeight': _freeWeight,
    'fullWeight': _fullWeight,
  };

  factory Truck.fromJson(Map<String, dynamic> json) => Truck(
    json['manufactureCompany'],
    DateTime.parse(json['manufactureDate']),
    json['model'],
    Engine.fromJson(json['engine']),
    json['plateNum'],
    GearType.values.firstWhere(
            (e) => e.toString().split('.').last == json['gearType']),
    json['bodySerialNum'],
    json['length'],
    json['width'],
    json['color'],
    json['freeWeight'].toDouble(),
    json['fullWeight'].toDouble(),
  );
}