import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/repositories/register_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../../../student_auth/data/models/studentModels.dart';
import '../entities/teacher_entities.dart';


@lazySingleton
class LogInTeacherUseCase {
  final AuthTeacherRepo authTeacherRepo;

  LogInTeacherUseCase({required this.authTeacherRepo});
  Future<Either<Failure,AuthModel>>call(TeacherLogInParams teacherLogInParams) async{
    return await authTeacherRepo.teacherLogIn(teacherLogInParams);
  }
}
class TeacherLogInParams{
  final  String password;
  final String teacherPhone;
  final String? fcmToken;

  TeacherLogInParams({required this.password, required this.teacherPhone,required this.fcmToken});
  Map<String,dynamic>get map=>{
    "password":password,
        "phoneNumber":teacherPhone,
    'fcmToken':fcmToken
  };



}