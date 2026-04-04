import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

class Motorcycle extends Automobile {
  double _tierDiameter;
  double _length;

  Motorcycle(
      String manufactureCompany,
      DateTime manufactureDate,
      String model,
      Engine engine,
      int plateNum,
      GearType gearType,
      int bodySerialNum,
      this._tierDiameter,
      this._length,
      ) : super(manufactureCompany, manufactureDate, model, engine, plateNum,
      gearType, bodySerialNum);

  double get tierDiameter => _tierDiameter;
  set tierDiameter(double val) => _tierDiameter = val;

  double get length => _length;
  set length(double val) => _length = val;

  @override
  VehicleType get type => VehicleType.motorcycle;

  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'tierDiameter': _tierDiameter,
    'length': _length,
  };

  factory Motorcycle.fromJson(Map<String, dynamic> json) => Motorcycle(
    json['manufactureCompany'],
    DateTime.parse(json['manufactureDate']),
    json['model'],
    Engine.fromJson(json['engine']),
    json['plateNum'],
    GearType.values.firstWhere(
            (e) => e.toString().split('.').last == json['gearType']),
    json['bodySerialNum'],
    json['tierDiameter'].toDouble(),
    json['length'].toDouble(),
  );
}