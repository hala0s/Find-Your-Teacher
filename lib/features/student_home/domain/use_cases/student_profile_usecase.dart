import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/student_profile_model.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class GetStudentProfileUseCase {
  final StudentProfileRepository studentProfileRepository;

  GetStudentProfileUseCase({required this.studentProfileRepository});

  Future<Either<Failure, StudentProfileModel>> call(
      StudentIdParam studentIdParam) async {
    return await studentProfileRepository.getStudentProfile(studentIdParam);
  }
}

class StudentIdParam {
  final String studentId;

  StudentIdParam({required this.studentId});

  Map<String, dynamic> get map => {
        "id": studentId,
      };
}
