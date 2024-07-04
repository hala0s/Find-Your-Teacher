import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/core/error/feilurs.dart';
import 'package:find_your_teacher/core/network/network.dart';
import 'package:find_your_teacher/features/student_home/data/data_sources/profile_data_source.dart';
import 'package:find_your_teacher/features/student_home/data/models/student_profile_model.dart';
import 'package:find_your_teacher/features/student_home/data/models/student_subjetcs_model.dart';
import 'package:find_your_teacher/features/student_home/data/models/take_number_model.dart';
import 'package:find_your_teacher/features/student_home/domain/use_cases/profile_usecase.dart';
import 'package:find_your_teacher/features/student_home/domain/use_cases/student_profile_usecase.dart';
import 'package:find_your_teacher/features/student_home/domain/use_cases/take_number_usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/teacher_by_sub_id_model.dart';

@LazySingleton(as: StudentProfileRepository)
class StudentProfileRepositoryImpl implements StudentProfileRepository {
  final StudentProfileRemote studentProfileRemote;
  final NetworkInfo networkInfo;

  StudentProfileRepositoryImpl(
      {required this.studentProfileRemote, required this.networkInfo});

  @override
  Future<Either<Failure, TeacherByIdModel>> getTeacherById(
      SubjectIdParam subjectIdParam) async {
    if (await networkInfo.isConnected) {
      try {
        final TeacherByIdModel subjectModel =
            await studentProfileRemote.getTeacherByIdProfile(subjectIdParam);
        return right(subjectModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, GetStudentSubjectsModel>> getStudentSubjects() async {
    if (await networkInfo.isConnected) {
      try {
        final GetStudentSubjectsModel subjectModel =
            await studentProfileRemote.getStudentSubjects();
        return right(subjectModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, TakeNumberModel>> getTeacherNumber(
      UserIdParam userIdParam) async {
    if (await networkInfo.isConnected) {
      try {
        final TakeNumberModel takeNumberModel =
            await studentProfileRemote.takeTeacherNumber(userIdParam);
        return right(takeNumberModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, StudentProfileModel>> getStudentProfile(
      StudentIdParam studentIdParam) async {
    if (await networkInfo.isConnected) {
      try {
        final StudentProfileModel studentProfileModel =
            await studentProfileRemote.getStudentProfile(studentIdParam);
        return right(studentProfileModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }
}
