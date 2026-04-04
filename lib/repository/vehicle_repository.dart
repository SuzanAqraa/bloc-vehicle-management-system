import 'package:bloc_task/services/vehicle_api_service.dart';

import '../models/motorcycle.dart';
import '../models/car.dart';
import '../models/truck.dart';
import '../repository/storage_service.dart';


class VehicleRepository {
  final VehicleApiService apiService;

  VehicleRepository({required this.apiService});

  List<Motorcycle> motorcycles = [];
  List<Car> cars = [];
  List<Truck> trucks = [];

  Future<void> loadVehicles() async {
    try {
      // جلب من API
      final apiData = await apiService.fetchVehicles();
      motorcycles = apiData['motorcycles'].map<Motorcycle>((x) => Motorcycle.fromJson(x)).toList();
      cars = apiData['cars'].map<Car>((x) => Car.fromJson(x)).toList();
      trucks = apiData['trucks'].map<Truck>((x) => Truck.fromJson(x)).toList();
      // حفظ نسخة offline
      await StorageService.saveData('vehicles', {
        'motorcycles': motorcycles.map((e) => e.toJson()).toList(),
        'cars': cars.map((e) => e.toJson()).toList(),
        'trucks': trucks.map((e) => e.toJson()).toList(),
      });
    } catch (e) {
      // fallback offline
      final localData = await StorageService.loadData('vehicles');
      if (localData != null) {
        motorcycles = (localData['motorcycles'] as List)
            .map((x) => Motorcycle.fromJson(x))
            .toList();
        cars = (localData['cars'] as List).map((x) => Car.fromJson(x)).toList();
        trucks = (localData['trucks'] as List).map((x) => Truck.fromJson(x)).toList();
      }
    }
  }

  Future<void> saveVehicles() async {
    await StorageService.saveData('vehicles', {
      'motorcycles': motorcycles.map((e) => e.toJson()).toList(),
      'cars': cars.map((e) => e.toJson()).toList(),
      'trucks': trucks.map((e) => e.toJson()).toList(),
    });
  }
}