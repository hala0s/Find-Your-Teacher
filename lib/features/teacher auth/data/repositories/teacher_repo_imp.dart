import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/core/error/feilurs.dart';
import 'package:find_your_teacher/core/network/network.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:find_your_teacher/features/teacher%20auth/data/data_sources/remote_teacher_data_source.dart';
import 'package:find_your_teacher/features/teacher%20auth/data/models/activate_teacher_model.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/use_cases/complete_profile2.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/use_cases/complete_teacher_profile_1.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/use_cases/login_teacher.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/use_cases/sign_up_teacher.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/use_cases/teacher_activate_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../student_auth/data/data_sources/local_data_source.dart';
import '../../../student_auth/data/models/studentModels.dart';
import '../../domain/entities/get_teacher_profile.dart';
import '../../domain/repositories/register_repository.dart';
import '../models/location_model.dart';

@LazySingleton(as: AuthTeacherRepo)
class AuthTeacherRepoImp implements AuthTeacherRepo {
  final AuthTeacherRemoteDataSource authTeacherRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  AuthTeacherRepoImp(
      {required this.authTeacherRemoteDataSource,
      required this.authLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, AuthModel>> teacherSigUp(
      TeacherSignUpParams teacherSignUpParams) async {
    if (await networkInfo.isConnected) {
      try {
        final AuthModel authModel =
            await authTeacherRemoteDataSource.teacherSigUp(teacherSignUpParams);
        authLocalDataSource.saveRole(authModel.user.role);
        authLocalDataSource.saveId(authModel.user.id);
        authLocalDataSource.saveName(authModel.user.userName);
        authLocalDataSource.saveToken(authModel.user.token, TypeUser.teacher);
        authLocalDataSource.savePhoneNumber(authModel.user.phoneNumber);

        return right(authModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, AuthModel>> teacherLogIn(
      TeacherLogInParams teacherLogInParams) async {
    if (await networkInfo.isConnected) {
      try {
        final AuthModel authModel =
            await authTeacherRemoteDataSource.teacherLogIn(teacherLogInParams);
        authLocalDataSource.saveRole(authModel.user.role);
        authLocalDataSource.saveId(authModel.user.id);
        authLocalDataSource.saveName(authModel.user.userName);
        authLocalDataSource.saveToken(authModel.user.token, TypeUser.teacher);
        authLocalDataSource.savePhoneNumber(authModel.user.phoneNumber);

        return right(authModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, GetTeacherProfileEntities>>
      getTeacherProfileBeforeComplete() async {
    if (await networkInfo.isConnected) {
      try {
        final getTeacherProfileBeforeComplete =
            await authTeacherRemoteDataSource.getTeacherProfileBeforeComplete();
        return right(getTeacherProfileBeforeComplete);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> completeTeacherProfile1(
      CompleteTeacherParams completeTeacherParams) async {
    if (await networkInfo.isConnected) {
      try {
        final completeTeacherProfile1 = await authTeacherRemoteDataSource
            .completeTeacherProfile1(completeTeacherParams);
        return right(completeTeacherProfile1);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> secondCompleteRegister(
      SecondRegisterParams secondRegisterParams) async {
    if (await networkInfo.isConnected) {
      try {
        final secondCompleteProfile = await authTeacherRemoteDataSource
            .secondCompleteRegister(secondRegisterParams);
        return right(secondCompleteProfile);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, LocationModel>> location() async {
    if (await networkInfo.isConnected) {
      try {
        final location = await authTeacherRemoteDataSource.location();
        return right(location);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, FilterModel>> getCompleteRegister() async {
    if (await networkInfo.isConnected) {
      try {
        final getCompleteProfile =
            await authTeacherRemoteDataSource.getCompleteRegister();
        return right(getCompleteProfile);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, TeacherActivateModel>> activateTeacher(IdParam idParam) async {
    if (await networkInfo.isConnected) {
      try {
        final teacherActivate =
            await authTeacherRemoteDataSource.teacherActivate(idParam);
        return right(teacherActivate);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }
}
