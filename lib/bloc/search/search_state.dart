import '../../models/automobile.dart';

abstract class SearchState {}

// 🟡 initial state
class SearchInitial extends SearchState {}

// 🔵 results found
class SearchResults extends SearchState {
  final List<Automobile> results;

  SearchResults(this.results);
}

// ⚪ no results
class SearchEmpty extends SearchState {}