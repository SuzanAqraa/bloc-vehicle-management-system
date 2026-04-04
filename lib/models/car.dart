import 'vehicle.dart';
import 'engine.dart';
import 'enums.dart';

class Car extends Vehicle {
  int _chairNum;
  bool _isFurnitureLeather;

  Car(
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
      this._chairNum,
      this._isFurnitureLeather)
      : super(manufactureCompany, manufactureDate, model, engine, plateNum,
      gearType, bodySerialNum, length, width, color);

  int get chairNum => _chairNum;
  set chairNum(int val) => _chairNum = val;

  bool get isFurnitureLeather => _isFurnitureLeather;
  set isFurnitureLeather(bool val) => _isFurnitureLeather = val;

  @override
  VehicleType get type => VehicleType.car;

  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'chairNum': _chairNum,
    'isFurnitureLeather': _isFurnitureLeather,
  };

  factory Car.fromJson(Map<String, dynamic> json) => Car(
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
    json['chairNum'],
    json['isFurnitureLeather'],
  );
}