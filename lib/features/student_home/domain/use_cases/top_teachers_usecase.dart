import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/student_home/domain/repositories/top_teachers_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/feilurs.dart';
import '../../data/models/teacher_by_user_id_model.dart';
import '../../data/models/top_teachers_model.dart';

@lazySingleton
class TopTeachersUseCase {
  final TopTeacherRepository topTeacherRepository;

  TopTeachersUseCase({required this.topTeacherRepository});
  Future<Either<Failure,TopTeachersModel>>call(ActiveParam activeParam) async{
    return await topTeacherRepository.getTopTeachers(
activeParam
    );
  }
}
class ActiveParam {
  final bool? active ;

  ActiveParam({required this.active});
  Map<String, dynamic> get map => {
    "active":active
  };
}

@lazySingleton
class TopTeachersByIdUseCase {
  final TopTeacherRepository topTeacherRepository;

  TopTeachersByIdUseCase({required this.topTeacherRepository});
  Future<Either<Failure,TeacherByUserIdModel>>call(UserIdParam userIdParam) async{
    return await topTeacherRepository.getTopTeachersById(userIdParam);
  }
}
class UserIdParam {
  final String userId;

  UserIdParam({required this.userId});
}
