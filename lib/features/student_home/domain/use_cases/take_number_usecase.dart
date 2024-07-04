import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/student_home/data/models/take_number_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/feilurs.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class TakeTeacherNumberUseCase {
  final StudentProfileRepository studentProfileRepository;

  TakeTeacherNumberUseCase({required this.studentProfileRepository});
  Future<Either<Failure,TakeNumberModel>>call(UserIdParam userIdParam) async{
    return await studentProfileRepository.getTeacherNumber(userIdParam);
  }
}
class UserIdParam {
  final String userId ;

  UserIdParam({required this.userId});
  Map<String,dynamic>get map=>{
    "userId":userId,

  };
}