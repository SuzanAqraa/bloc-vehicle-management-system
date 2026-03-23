import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/vehicle_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final VehicleRepository repo;

  SearchBloc(this.repo) : super(SearchInitial()) {
    on<SearchByCompanyEvent>((event, emit) {
      final all = [...repo.cars, ...repo.trucks, ...repo.motorcycles];

      final results = all
          .where((v) =>
      v.manufactureCompany.toLowerCase() ==
          event.company.toLowerCase())
          .toList();

      if (results.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchResults(results));
      }
    });

    on<SearchByPlateEvent>((event, emit) {
      final all = [...repo.cars, ...repo.trucks, ...repo.motorcycles];

      final results =
      all.where((v) => v.plateNum == event.plate).toList();

      if (results.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchResults(results));
      }
    });

    on<SearchByDateEvent>((event, emit) {
      final all = [...repo.cars, ...repo.trucks, ...repo.motorcycles];

      final results = all
          .where((v) =>
      v.manufactureDate.year == event.date.year &&
          v.manufactureDate.month == event.date.month &&
          v.manufactureDate.day == event.date.day)
          .toList();

      if (results.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchResults(results));
      }
    });

    on<ClearSearchEvent>((event, emit) {
      emit(SearchInitial());
    });
  }
}