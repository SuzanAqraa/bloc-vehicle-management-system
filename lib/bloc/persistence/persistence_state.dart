import 'package:equatable/equatable.dart';

abstract class PersistenceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PersistenceIdle extends PersistenceState {}
class PersistenceSaving extends PersistenceState {}
class PersistenceLoaded extends PersistenceState {
  final dynamic data;
  PersistenceLoaded(this.data);
  @override
  List<Object?> get props => [data];
}
class PersistenceError extends PersistenceState {
  final String message;
  PersistenceError(this.message);
  @override
  List<Object?> get props => [message];
}