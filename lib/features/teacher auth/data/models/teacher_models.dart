import 'package:find_your_teacher/features/teacher%20auth/domain/entities/teacher_entities.dart';

class TeacherModel extends TeacherEntities {
  TeacherModel(
      {required String teacherName,
      required String teacherPhone,
      required String teacherId,
      required String teacherToken,
      required String role,
      required String teacherAboutMe,
      required List<String> teacherSubjectTeaching,
      required List<String> teacherLocation,
      required List<String> teacheracademic,
      required String teacherPhoto})
      : super(
            teacherPhoto: teacherPhoto,
            teacherAboutMe: teacherAboutMe,
            teacherSubjectTeaching: teacherSubjectTeaching,
            teacherLocation: teacherLocation,
            teacheracademic: teacheracademic,
            teacherName: teacherName,
            role: role,
            teacherPhone: teacherPhone,
            teacherId: teacherId,
            teacherToken: teacherToken);

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      role: json['user']['role'] ?? " ",
      teacherName: json['user']['userName'] ?? " ",
      teacherPhone: json['user']['phoneNumber'] ?? " ",
      teacherId: json['user']['_id'] ?? " ",
      teacherToken: json['user']['token'] ?? "",
      teacherAboutMe: json['user']['aboutMe'] ?? " ",
      teacherSubjectTeaching:
          List<String>.from(json["user"]['subjectName'].map((x) => x)),
      teacherLocation:
          List<String>.from(json['user']['locationsName'].map((x) => x)),
      teacheracademic:
          List<String>.from(json['user']['academicLevelName'].map((x) => x)),
      teacherPhoto: json['user']['profilePhoto']['url'] ?? " ",
    );
  }
}
