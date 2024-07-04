import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/core/error/feilurs.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:find_your_teacher/features/student_auth/data/models/studentModels.dart';
import 'package:find_your_teacher/features/teacher%20auth/data/models/activate_teacher_model.dart';
import 'package:find_your_teacher/features/teacher%20auth/data/models/complete_registrer_model.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/entities/location_entities.dart';

import '../../data/models/location_model.dart';
import '../entities/get_teacher_profile.dart';
import '../entities/teacher_entities.dart';
import '../use_cases/complete_profile2.dart';
import '../use_cases/complete_teacher_profile_1.dart';
import '../use_cases/login_teacher.dart';
import '../use_cases/sign_up_teacher.dart';
import '../use_cases/teacher_activate_usecase.dart';

abstract class AuthTeacherRepo {
  Future<Either<Failure, AuthModel>> teacherSigUp(
      TeacherSignUpParams teacherSignUpParams);

  Future<Either<Failure, AuthModel>> teacherLogIn(
      TeacherLogInParams teacherLogInParams);

  Future<Either<Failure, GetTeacherProfileEntities>>
      getTeacherProfileBeforeComplete();


  Future<Either<Failure, Unit>> completeTeacherProfile1(
      CompleteTeacherParams completeTeacherParams);


  Future<Either<Failure, Unit>> secondCompleteRegister(
      SecondRegisterParams secondRegisterParams);

  Future<Either<Failure, LocationModel>> location();
  Future<Either<Failure, FilterModel>> getCompleteRegister(
      );
  Future<Either<Failure, TeacherActivateModel>> activateTeacher(IdParam idParam);

}
