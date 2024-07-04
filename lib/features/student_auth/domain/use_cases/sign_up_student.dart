import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/student_auth/domain/entities/auth_entities.dart';
import 'package:find_your_teacher/features/student_auth/domain/repositories/AuthRepositories.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/studentModels.dart';

@lazySingleton
class SignUpStudentUseCase {
  final AuthStudentRepo authStudentRepositories;

  SignUpStudentUseCase({required this.authStudentRepositories});

  Future<Either<Failure, AuthModel>> call(
      SignUpStudentParams signInStudentParams) async {
    return await authStudentRepositories.studentSignUp(signInStudentParams);
  }
}

class SignUpStudentParams {
  final String studentName;
  final String studentPhoneNumber;
  final String studentPassword;
  final String role;
  final String gender;
  final String? fcmToken;

  SignUpStudentParams({
    required this.studentName,
    required this.gender,
    required this.fcmToken,
    required this.studentPhoneNumber,
    required this.studentPassword,
    required this.role,
  });

  Map<String, dynamic> get map => {
        'userName': studentName,
        "phoneNumber": studentPhoneNumber,
        'password': studentPassword,
        'role': role,
        'gender': gender,
        'fcmToken': fcmToken
      };
}
