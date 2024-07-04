import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/student_auth/data/models/studentModels.dart';
import 'package:find_your_teacher/features/student_auth/domain/repositories/AuthRepositories.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../entities/auth_entities.dart';
@lazySingleton
class LogInStudentUseCase{
  final AuthStudentRepo authStudentRepo;

  LogInStudentUseCase({required this.authStudentRepo});
  Future<Either<Failure,AuthModel>>call(LogInStudentParams logInStudentParams)async{
   return   await authStudentRepo.studentLogIn(logInStudentParams);
  }


}
class LogInStudentParams {
  final String studentPhoneNumber;
  final String studentPassword;
  final String? fcmToken;

  LogInStudentParams({required this.studentPhoneNumber, required this.studentPassword,required this.fcmToken});
  Map<String,dynamic> get map=>{
    "phoneNumber": studentPhoneNumber,
    'password': studentPassword,
    'fcmToken':fcmToken,
  };

}
