abstract class PersistenceState {}

class PersistenceIdle extends PersistenceState {}

class PersistenceSaving extends PersistenceState {}

class PersistenceLoaded extends PersistenceState {}

class PersistenceError extends PersistenceState {
  final String message;
  PersistenceError(this.message);
}