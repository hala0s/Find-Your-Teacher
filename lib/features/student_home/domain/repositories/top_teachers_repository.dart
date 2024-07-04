import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/student_home/data/models/top_teachers_model.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/teacher_by_user_id_model.dart';
import '../use_cases/top_teachers_usecase.dart';

abstract class TopTeacherRepository {
  Future<Either<Failure, TopTeachersModel>> getTopTeachers( ActiveParam activeParam
    );
  Future<Either<Failure, TeacherByUserIdModel>> getTopTeachersById(
UserIdParam userIdParam
      );

}