import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName.json');
  }

  static Future<void> saveData(String fileName, Map<String, dynamic> data) async {
    final file = await _localFile(fileName);
    await file.writeAsString(jsonEncode(data));
  }

  static Future<Map<String, dynamic>?> loadData(String fileName) async {
    try {
      final file = await _localFile(fileName);
      if (await file.exists()) {
        final content = await file.readAsString();
        return jsonDecode(content);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}