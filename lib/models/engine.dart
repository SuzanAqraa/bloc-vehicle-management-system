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
      this._fuelType);

  // getters & setters
  String get manufacture => _manufacture;
  set manufacture(String val) => _manufacture = val;

  DateTime get manufactureDate => _manufactureDate;
  set manufactureDate(DateTime val) => _manufactureDate = val;

  String get model => _model;
  set model(String val) => _model = val;

  int get capacity => _capacity;
  set capacity(int val) => _capacity = val;

  int get cylinders => _cylinders;
  set cylinders(int val) => _cylinders = val;

  FuelType get fuelType => _fuelType;
  set fuelType(FuelType val) => _fuelType = val;

  // JSON
  Map<String, dynamic> toJson() => {
    'manufacture': _manufacture,
    'manufactureDate': _manufactureDate.toIso8601String(),
    'model': _model,
    'capacity': _capacity,
    'cylinders': _cylinders,
    'fuelType': _fuelType.toString().split('.').last,
  };

  factory Engine.fromJson(Map<String, dynamic> json) => Engine(
    json['manufacture'],
    DateTime.parse(json['manufactureDate']),
    json['model'],
    json['capacity'],
    json['cylinders'],
    FuelType.values.firstWhere(
            (e) => e.toString().split('.').last == json['fuelType']),
  );
}