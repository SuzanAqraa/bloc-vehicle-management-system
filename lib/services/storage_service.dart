import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static const String _fileName = 'vehicles.json';

  /// 📍 get file path
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$_fileName';
    return File(path);
  }

  /// 💾 Save JSON to file
  Future<void> saveVehicles(Map<String, dynamic> data) async {
    try {
      final file = await _getFile();

      final jsonString = jsonEncode(data);

      await file.writeAsString(jsonString);

      print('✅ Vehicles saved successfully');
    } catch (e) {
      print('❌ Error saving vehicles: $e');
      rethrow;
    }
  }

  /// 📥 Load JSON from file
  Future<Map<String, dynamic>> loadVehicles() async {
    try {
      final file = await _getFile();


      if (!await file.exists()) {
        return {
          "cars": [],
          "trucks": [],
          "motorcycles": [],
        };
      }

      final jsonString = await file.readAsString();

      final data = jsonDecode(jsonString);

      print('✅ Vehicles loaded successfully');

      return data;
    } catch (e) {
      print('❌ Error loading vehicles: $e');


      return {
        "cars": [],
        "trucks": [],
        "motorcycles": [],
      };
    }
  }
}