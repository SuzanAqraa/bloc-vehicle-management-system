import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageService {
  Future<File> _file() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/vehicles.json');
  }

  Future<void> save(Map<String, dynamic> data) async {
    final file = await _file();
    await file.writeAsString(jsonEncode(data));
  }

  Future<Map<String, dynamic>> load() async {
    final file = await _file();
    if (!await file.exists()) return {};
    return jsonDecode(await file.readAsString());
  }
}