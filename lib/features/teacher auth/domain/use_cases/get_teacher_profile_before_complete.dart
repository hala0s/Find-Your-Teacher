import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/core/error/feilurs.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/entities/teacher_entities.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/repositories/register_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/get_teacher_profile.dart';
@lazySingleton
class GetTeacherProfileBeforeCompleteUseCase{
  final AuthTeacherRepo authTeacherRepo;

  GetTeacherProfileBeforeCompleteUseCase({required this.authTeacherRepo});
  Future<Either<Failure,GetTeacherProfileEntities>>call()async{
     return await authTeacherRepo.getTeacherProfileBeforeComplete();
  }
}