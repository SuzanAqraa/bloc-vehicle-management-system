import 'package:equatable/equatable.dart';
import '../../models/automobile.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}
class SearchResults extends SearchState {
  final List<Automobile> results;
  SearchResults(this.results);
  @override
  List<Object?> get props => [results];
}
class SearchEmpty extends SearchState {}