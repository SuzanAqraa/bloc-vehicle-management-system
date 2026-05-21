import 'package:dio/dio.dart';

class VehicleApiService {
  final Dio dio = Dio(
    BaseOptions(

      baseUrl: "https://69e5fc60ce4e908a155ebf41.mockapi.io",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // 📥 GET all vehicles
  Future<List<dynamic>> getVehicles() async {
    try {
      final res = await dio.get("/vehicles");
      return res.data;
    } on DioException catch (e) {
      throw Exception("GET error: ${e.message}");
    }
  }

  // ➕ ADD vehicle
  Future<void> addVehicle(Map<String, dynamic> data) async {
    try {
      await dio.post("/vehicles", data: data);
    } on DioException catch (e) {
      throw Exception("POST error: ${e.message}");
    }
  }

  // ✏️ UPDATE vehicle
  Future<void> updateVehicle(String id, Map<String, dynamic> data) async {
    try {
      await dio.put("/vehicles/$id", data: data);
    } on DioException catch (e) {
      throw Exception("PUT error: ${e.message}");
    }
  }

  // ❌ DELETE vehicle
  Future<void> deleteVehicle(String id) async {
    try {
      await dio.delete("/vehicles/$id");
    } on DioException catch (e) {
      throw Exception("DELETE error: ${e.message}");
    }
  }
}