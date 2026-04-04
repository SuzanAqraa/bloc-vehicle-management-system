import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_event.dart';
import 'search_state.dart';
import '../../repository/vehicle_repository.dart';
import '../../models/automobile.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final VehicleRepository repository;

  SearchBloc(this.repository) : super(SearchInitial()) {
    on<SearchByCompanyEvent>((event, emit) {
      final results = [
        ...repository.motorcycles,
        ...repository.cars,
        ...repository.trucks
      ].where((v) => v.manufactureCompany.toLowerCase().contains(event.company.toLowerCase())).toList();

      if (results.isEmpty) emit(SearchEmpty());
      else emit(SearchResults(results));
    });

    on<SearchByDateEvent>((event, emit) {
      final results = [
        ...repository.motorcycles,
        ...repository.cars,
        ...repository.trucks
      ].where((v) => v.manufactureDate == event.date).toList();

      if (results.isEmpty) emit(SearchEmpty());
      else emit(SearchResults(results));
    });

    on<SearchByPlateEvent>((event, emit) {
      final results = [
        ...repository.motorcycles,
        ...repository.cars,
        ...repository.trucks
      ].where((v) => v.plateNum == event.plateNum).toList();

      if (results.isEmpty) emit(SearchEmpty());
      else emit(SearchResults(results));
    });

    on<ClearSearchEvent>((event, emit) => emit(SearchInitial()));
  }
}