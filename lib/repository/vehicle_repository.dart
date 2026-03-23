import '../models/car.dart';
import '../models/truck.dart';
import '../models/motorcycle.dart';
import 'storage_service.dart';

class VehicleRepository {
  final StorageService storage;

  List<Car> cars = [];
  List<Truck> trucks = [];
  List<Motorcycle> motorcycles = [];

  VehicleRepository(this.storage);

  Future<void> load() async {
    final data = await storage.load();

    cars = (data['cars'] ?? [])
        .map<Car>((e) => Car.fromJson(e))
        .toList();

    trucks = (data['trucks'] ?? [])
        .map<Truck>((e) => Truck.fromJson(e))
        .toList();

    motorcycles = (data['motorcycles'] ?? [])
        .map<Motorcycle>((e) => Motorcycle.fromJson(e))
        .toList();
  }

  Future<void> save() async {
    await storage.save({
      'cars': cars.map((e) => e.toJson()).toList(),
      'trucks': trucks.map((e) => e.toJson()).toList(),
      'motorcycles': motorcycles.map((e) => e.toJson()).toList(),
    });
  }
}