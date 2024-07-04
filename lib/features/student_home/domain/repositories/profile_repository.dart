import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/student_home/data/models/student_profile_model.dart';
import 'package:find_your_teacher/features/student_home/data/models/student_subjetcs_model.dart';
import 'package:find_your_teacher/features/student_home/data/models/take_number_model.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/teacher_by_sub_id_model.dart';
import '../use_cases/profile_usecase.dart';
import '../use_cases/student_profile_usecase.dart';
import '../use_cases/take_number_usecase.dart';

abstract class StudentProfileRepository {
  Future<Either<Failure, TeacherByIdModel>> getTeacherById(
      SubjectIdParam subjectIdParam);

  Future<Either<Failure, GetStudentSubjectsModel>> getStudentSubjects();

  Future<Either<Failure, TakeNumberModel>> getTeacherNumber(
      UserIdParam userIdParam);

  Future<Either<Failure, StudentProfileModel>> getStudentProfile(
      StudentIdParam studentIdParam);
}
