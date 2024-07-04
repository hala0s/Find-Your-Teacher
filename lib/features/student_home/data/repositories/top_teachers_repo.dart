import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/core/error/feilurs.dart';
import 'package:find_your_teacher/core/network/network.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/search_model.dart';
import 'package:find_your_teacher/features/student_home/data/data_sources/top_teachers_remote_data.dart';
import 'package:find_your_teacher/features/student_home/data/models/teacher_by_user_id_model.dart';
import 'package:find_your_teacher/features/student_home/domain/repositories/top_teachers_repository.dart';
import 'package:find_your_teacher/features/student_home/domain/use_cases/top_teachers_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/teacher_by_sub_id_model.dart';
import '../models/top_teachers_model.dart';

@LazySingleton(as: TopTeacherRepository)
class TopTeachersImpl implements TopTeacherRepository {
  final NetworkInfo networkInfo;
  final TopTeachersRemote topTeachersRemote;

  TopTeachersImpl({required this.networkInfo, required this.topTeachersRemote});

  @override
  Future<Either<Failure, TopTeachersModel>> getTopTeachers(activeParam) async {
    if (await networkInfo.isConnected) {
      try {
        final TopTeachersModel topTeachers =
            await topTeachersRemote.getTopTeachers(activeParam);
        return right(topTeachers);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }



@override
  Future<Either<Failure, TeacherByUserIdModel>> getTopTeachersById(UserIdParam userIdParam)async {
  if (await networkInfo.isConnected) {
    try {
      final TeacherByUserIdModel getTeacherById =
          await topTeachersRemote.getTopTeachersById(userIdParam);
      return right(getTeacherById);
    } on ServerException {
      return left(ServerFailure());
    }
  } else {
    return left(EmptyCacheFailure());
  }
}}