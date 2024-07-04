import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/teacher%20auth/data/models/activate_teacher_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../repositories/register_repository.dart';

@lazySingleton
class TeacherActivateUseCase{
  final AuthTeacherRepo authTeacherRepo;

  TeacherActivateUseCase({required this.authTeacherRepo});
  Future<Either<Failure,TeacherActivateModel>>call(IdParam idParam)async{
    return await authTeacherRepo.activateTeacher(idParam);
  }
}

class IdParam {
  final String id ;

  IdParam({required this.id});
  Map<String,dynamic>get map=>{
    "id":id,

  };
}