import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

abstract class Vehicle extends Automobile {
  int _length;
  int _width;
  String _color;

  Vehicle(
      String manufactureCompany,
      DateTime manufactureDate,
      String model,
      Engine engine,
      int plateNum,
      GearType gearType,
      int bodySerialNum,
      this._length,
      this._width,
      this._color)
      : super(manufactureCompany, manufactureDate, model, engine, plateNum,
      gearType, bodySerialNum);

  int get length => _length;
  set length(int val) => _length = val;

  int get width => _width;
  set width(int val) => _width = val;

  String get color => _color;
  set color(String val) => _color = val;

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'length': _length,
    'width': _width,
    'color': _color,
  };
}