import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/repositories/register_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/complete_registrer_model.dart';

@lazySingleton
class GetCompleteProfileUseCase {
  final AuthTeacherRepo authTeacherRepo;

  GetCompleteProfileUseCase({required this.authTeacherRepo});
  Future<Either<Failure, FilterModel>> call() async {
    return await authTeacherRepo.getCompleteRegister();
  }
}
