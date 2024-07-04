part of 'search_and_filter_bloc.dart';

@immutable
abstract class SearchAndFilterEvent {}

class SearchEvent extends SearchAndFilterEvent {
  final String userName;

  final String role;

  SearchEvent({required this.userName, required this.role});
}

class FilterEvent extends SearchAndFilterEvent {
  final List<String> locationIds;
  final List<String> subjectIds;
  final List<String> academicLevels;
  final String genderName;
  final int? maxPrice;
  final bool? active;
  final VoidCallback onSuccess;

  FilterEvent(
      {required this.locationIds,
      this.active,
      this.maxPrice,
      required this.genderName,
      required this.academicLevels,
      required this.subjectIds,
      required this.onSuccess});
}

class GetFilterEvent extends SearchAndFilterEvent {}

class LocationSearchEvent extends SearchAndFilterEvent {
  final String word;

  LocationSearchEvent({required this.word});
}
