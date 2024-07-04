import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/feilurs.dart';
import '../../../teacher auth/domain/entities/teacher_entities.dart';
import '../../data/models/profile_model.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class TeacherProfileUseCase {
  final ProfileRepository iProfileRepository;

  TeacherProfileUseCase({required this.iProfileRepository});
  Future<Either<Failure,TeacherProfileModel>>call( ) async{
    return await iProfileRepository.getTeacherProfile();
  }
}
