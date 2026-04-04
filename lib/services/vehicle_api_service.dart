import 'package:dio/dio.dart';
import '../models/motorcycle.dart';
import '../models/car.dart';
import '../models/truck.dart';

class VehicleApiService {
  final Dio dio;

  VehicleApiService({required this.dio});

  Future<List<Motorcycle>> fetchMotorcycles() async {
    final response = await dio.get('/motorcycles');
    return (response.data as List)
        .map((json) => Motorcycle.fromJson(json))
        .toList();
  }

  Future<List<Car>> fetchCars() async {
    final response = await dio.get('/cars');
    return (response.data as List).map((json) => Car.fromJson(json)).toList();
  }

  Future<List<Truck>> fetchTrucks() async {
    final response = await dio.get('/trucks');
    return (response.data as List)
        .map((json) => Truck.fromJson(json))
        .toList();
  }

  Future<void> addVehicle(Map<String, dynamic> json, String type) async {
    await dio.post('/$type', data: json);
  }

  Future<void> updateVehicle(int id, Map<String, dynamic> json, String type) async {
    await dio.put('/$type/$id', data: json);
  }

  Future<void> deleteVehicle(int id, String type) async {
    await dio.delete('/$type/$id');
  }
}