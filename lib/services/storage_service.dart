class StorageService {
  final Map<String, String> _cache = {};

  void saveData(String key, String value) {
    _cache[key] = value;
  }

  String? getData(String key) {
    return _cache[key];
  }
}