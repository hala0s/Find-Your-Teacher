import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/available_model.dart';
import '../../data/models/profile_model.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class AvailableForStudentUseCase {
  final ProfileRepository profileRepository;

  AvailableForStudentUseCase({required this.profileRepository});

  Future<Either<Failure, AvailableModel>> call(
      AvailableForStudentsParams availableForStudentsParams) async {
    return await profileRepository
        .availableForStudents(availableForStudentsParams);
  }
}

class AvailableForStudentsParams {
  final bool available;

  AvailableForStudentsParams({required this.available});

  Map<String, dynamic> get map => {'available': available};
}
