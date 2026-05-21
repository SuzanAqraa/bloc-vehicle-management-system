

abstract class SearchEvent {}

// 🔍 Search by company name
class SearchByCompanyEvent extends SearchEvent {
  final String company;
  SearchByCompanyEvent(this.company);
}

// 📅 Search by date
class SearchByDateEvent extends SearchEvent {
  final DateTime date;
  SearchByDateEvent(this.date);
}

// 🔢 Search by plate number
class SearchByPlateEvent extends SearchEvent {
  final int plateNum;
  SearchByPlateEvent(this.plateNum);
}

// ❌ Clear search
class ClearSearchEvent extends SearchEvent {}