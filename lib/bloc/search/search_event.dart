import 'package:equatable/equatable.dart';
import '../../models/automobile.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchByCompanyEvent extends SearchEvent {
  final String company;
  SearchByCompanyEvent(this.company);
}

class SearchByDateEvent extends SearchEvent {
  final DateTime date;
  SearchByDateEvent(this.date);
}

class SearchByPlateEvent extends SearchEvent {
  final int plateNum;
  SearchByPlateEvent(this.plateNum);
}

class ClearSearchEvent extends SearchEvent {}