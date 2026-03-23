import 'engine.dart';
import 'enums.dart';

class Automobile {
  String manufactureCompany;
  DateTime manufactureDate;
  String model;
  Engine engine;
  int plateNum;
  GearType gearType;
  int bodySerialNum;

  Automobile(
      this.manufactureCompany,
      this.manufactureDate,
      this.model,
      this.engine,
      this.plateNum,
      this.gearType,
      this.bodySerialNum,
      );

  Map<String, dynamic> baseJson() => {
    'manufactureCompany': manufactureCompany,
    'manufactureDate': manufactureDate.toIso8601String(),
    'model': model,
    'engine': engine.toJson(),
    'plateNum': plateNum,
    'gearType': gearType.name,
    'bodySerialNum': bodySerialNum,
  };
}