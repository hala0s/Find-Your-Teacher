import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/repositories/register_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../../../student_auth/data/models/studentModels.dart';
import '../entities/teacher_entities.dart';

@lazySingleton
class SignUpTeacherUseCase {
  final AuthTeacherRepo authTeacherRepo;

  SignUpTeacherUseCase({required this.authTeacherRepo});

  Future<Either<Failure, AuthModel>> call(
      TeacherSignUpParams teacherSignUpParams) async {
    return await authTeacherRepo.teacherSigUp(teacherSignUpParams);
  }
}

class TeacherSignUpParams {
  final String teacherName;
  final String teacherPhone;
  final String teacherGender;
  final String teacherPassword;
  final String role;
  final String ?fcmToken;

  TeacherSignUpParams(
      {required this.teacherName,
      required this.fcmToken,
      required this.teacherGender,
      required this.teacherPhone,
      required this.teacherPassword,
      required this.role});

  Map<String, dynamic> get map => {
        'userName': teacherName,
        'phoneNumber': teacherPhone,
        "password": teacherPassword,
        "role": role,
        'gender': teacherGender,
    'fcmToken':fcmToken
      };
}
