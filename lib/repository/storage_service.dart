import 'dart:convert';
import 'dart:io';

class StorageService {
  final String path = 'vehicles.json';

  Future<void> save(Map<String, dynamic> data) async {
    final file = File(path);
    await file.writeAsString(jsonEncode(data));
  }

  Future<Map<String, dynamic>> load() async {
    final file = File(path);
    if (!await file.exists()) return {};

    final content = await file.readAsString();
    return jsonDecode(content);
  }
}