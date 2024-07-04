import 'package:equatable/equatable.dart';

class TeacherEntities extends Equatable {
  final String teacherName;
  final String teacherPhoto;
  final String teacherAboutMe;
  final String teacherPhone;
  final String teacherToken;
  final String teacherId;
  final String role;
  final List<String> teacherSubjectTeaching;
  final List<String> teacherLocation;
  final List<String> teacheracademic;

  TeacherEntities({
    required this.teacherPhoto,
    required this.teacherAboutMe,
    required this.teacherSubjectTeaching,
    required this.teacherLocation,
    required this.teacheracademic,
    required this.teacherName,
    required this.teacherPhone,
    required this.role,
    required this.teacherId,
    required this.teacherToken,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        teacherName,
        teacherId,
        teacherPhone,
        teacherToken,
        role,
        teacherAboutMe,
        teacherSubjectTeaching,
        teacherLocation,
        teacheracademic,
      ];
}
