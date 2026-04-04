import 'engine.dart';
import 'enums.dart';

abstract class Automobile {
  String _manufactureCompany;
  DateTime _manufactureDate;
  String _model;
  Engine _engine;
  int _plateNum;
  GearType _gearType;
  int _bodySerialNum;

  Automobile(
      this._manufactureCompany,
      this._manufactureDate,
      this._model,
      this._engine,
      this._plateNum,
      this._gearType,
      this._bodySerialNum);

  // getters & setters
  String get manufactureCompany => _manufactureCompany;
  set manufactureCompany(String val) => _manufactureCompany = val;

  DateTime get manufactureDate => _manufactureDate;
  set manufactureDate(DateTime val) => _manufactureDate = val;

  String get model => _model;
  set model(String val) => _model = val;

  Engine get engine => _engine;
  set engine(Engine val) => _engine = val;

  int get plateNum => _plateNum;
  set plateNum(int val) => _plateNum = val;

  GearType get gearType => _gearType;
  set gearType(GearType val) => _gearType = val;

  int get bodySerialNum => _bodySerialNum;
  set bodySerialNum(int val) => _bodySerialNum = val;

  VehicleType get type;

  Map<String, dynamic> toJson() => {
    'manufactureCompany': _manufactureCompany,
    'manufactureDate': _manufactureDate.toIso8601String(),
    'model': _model,
    'engine': _engine.toJson(),
    'plateNum': _plateNum,
    'gearType': _gearType.toString().split('.').last,
    'bodySerialNum': _bodySerialNum,
  };
}