class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);
}