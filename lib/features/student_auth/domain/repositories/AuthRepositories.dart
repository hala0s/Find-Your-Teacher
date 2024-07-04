import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/student_auth/domain/entities/auth_entities.dart';
import 'package:find_your_teacher/features/student_auth/domain/use_cases/log_in_student.dart';
import 'package:find_your_teacher/features/student_auth/domain/use_cases/sign_up_student.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/studentModels.dart';

 abstract class AuthStudentRepo {
  Future<Either<Failure, AuthModel>> studentSignUp(SignUpStudentParams signInStudentParams);
  Future<Either<Failure,AuthModel>>studentLogIn(LogInStudentParams logInStudentParams);
}
