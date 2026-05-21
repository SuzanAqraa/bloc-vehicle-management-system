abstract class PersistenceState {}

class PersistenceIdle extends PersistenceState {}

class PersistenceLoading extends PersistenceState {}

class PersistenceLoaded extends PersistenceState {
  final Map<String, dynamic> data;
  PersistenceLoaded(this.data);
}

class PersistenceError extends PersistenceState {
  final String message;
  PersistenceError(this.message);
}