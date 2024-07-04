import 'package:equatable/equatable.dart';

class GetTeacherProfileEntities extends Equatable{
  final String userName;
  final String phoneNumber;

  const GetTeacherProfileEntities({required this.userName, required this.phoneNumber});

  @override
  // TODO: implement props
  List<Object?> get props =>[userName,phoneNumber];

}