import '../../domain/entities/get_teacher_profile.dart';

class GetTeacherProfileModel extends GetTeacherProfileEntities {
  GetTeacherProfileModel({required super.userName, required super.phoneNumber});

  factory GetTeacherProfileModel.fromJson(Map<String, dynamic> json) {
    return GetTeacherProfileModel(
        userName: json['user']["userName"] ,
        phoneNumber: json['user']["phoneNumber"] );
  }
}
