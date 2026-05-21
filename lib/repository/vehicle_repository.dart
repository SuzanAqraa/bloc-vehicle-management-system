import '../models/car.dart';
import '../models/truck.dart';
import '../models/motorcycle.dart';
import '../models/automobile.dart';
import '../services/vehicle_api_service.dart';

class VehicleRepository {
  final VehicleApiService api;

  List<Car> cars = [];
  List<Truck> trucks = [];
  List<Motorcycle> motorcycles = [];

  VehicleRepository(this.api);

  List<Automobile> get allVehicles => [...cars, ...trucks, ...motorcycles];

  Future<void> load() async {
    final data = await api.getVehicles();

    cars.clear();
    trucks.clear();
    motorcycles.clear();

    for (var item in data) {
      print("🔥 RAW ITEM: $item"); // 👈 هنا

      if (item["type"] == "car") {
        cars.add(Car.fromJson(item));
      } else if (item["type"] == "truck") {
        trucks.add(Truck.fromJson(item));
      } else if (item["type"] == "motorcycle") {
        motorcycles.add(Motorcycle.fromJson(item));
      }
    }
  }

  Future<void> add(dynamic vehicle) async {
    await api.addVehicle(vehicle.toJson());
    await load();
  }

  Future<void> addCar(Car car) async {
    await api.addVehicle(car.toJson());
    await load();
  }

  Future<void> addTruck(Truck truck) async {
    await api.addVehicle(truck.toJson());
    await load();
  }

  Future<void> addMotorcycle(Motorcycle motorcycle) async {
    await api.addVehicle(motorcycle.toJson());
    await load();
  }
}