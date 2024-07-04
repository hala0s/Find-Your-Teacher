part of 'available_for_students_bloc.dart';

@immutable
 class AvailableForStudentsEvent {
  final bool available;
  final VoidCallback onSuccess;

  AvailableForStudentsEvent({required this.available,required this.onSuccess});
}
