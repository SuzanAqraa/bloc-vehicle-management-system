import 'package:equatable/equatable.dart';

abstract class PersistenceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PersistLoadEvent extends PersistenceEvent {}
class PersistSaveEvent extends PersistenceEvent {}