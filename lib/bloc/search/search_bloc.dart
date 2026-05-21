import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/vehicle_repository.dart';
import '../../models/automobile.dart';
abstract class SearchEvent {}
class SearchByCompany extends SearchEvent {
  final String company;
  SearchByCompany(this.company);
}

abstract class SearchState {}
class SearchInitial extends SearchState {}
class SearchResults extends SearchState {
  final List<Automobile> results;
  SearchResults(this.results);
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final VehicleRepository repo;

  SearchBloc(this.repo) : super(SearchInitial()) {
    on<SearchByCompany>((event, emit) {
      final results = repo.allVehicles
          .where((v) => v.manufactureCompany.contains(event.company))
          .toList();

      emit(SearchResults(results));
    });
  }
}