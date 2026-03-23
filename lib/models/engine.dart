import 'enums.dart';

class Engine {
  String _manufacture;
  DateTime _manufactureDate;
  String _model;
  int _capacity;
  int _cylinders;
  FuelType _fuelType;

  Engine(
      this._manufacture,
      this._manufactureDate,
      this._model,
      this._capacity,
      this._cylinders,
      this._fuelType,
      );

  Map<String, dynamic> toJson() => {
    'manufacture': _manufacture,
    'manufactureDate': _manufactureDate.toIso8601String(),
    'model': _model,
    'capacity': _capacity,
    'cylinders': _cylinders,
    'fuelType': _fuelType.name,
  };

  factory Engine.fromJson(Map<String, dynamic> json) {
    return Engine(
      json['manufacture'],
      DateTime.parse(json['manufactureDate']),
      json['model'],
      json['capacity'],
      json['cylinders'],
      FuelType.values.firstWhere((e) => e.name == json['fuelType']),
    );
  }

  // getters
  String get manufacture => _manufacture;
  DateTime get manufactureDate => _manufactureDate;
  String get model => _model;
  int get capacity => _capacity;
  int get cylinders => _cylinders;
  FuelType get fuelType => _fuelType;
}