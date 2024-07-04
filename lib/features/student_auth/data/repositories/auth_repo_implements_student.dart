import 'package:dartz/dartz.dart';

import 'package:find_your_teacher/features/student_auth/domain/entities/auth_entities.dart';
import 'package:find_your_teacher/features/student_auth/domain/use_cases/log_in_student.dart';

import 'package:find_your_teacher/features/student_auth/domain/use_cases/sign_up_student.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/feilurs.dart';
import '../../../../core/network/network.dart';
import '../../domain/repositories/AuthRepositories.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../models/studentModels.dart';

@LazySingleton(as: AuthStudentRepo)
class AuthStudentRepositoriesImp implements AuthStudentRepo {
  final AutStudentRemoteDataSource autStudentRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  AuthStudentRepositoriesImp(
      {required this.autStudentRemoteDataSource,
      required this.networkInfo,
      required this.authLocalDataSource});

  @override
  Future<Either<Failure, AuthModel>> studentSignUp(
      SignUpStudentParams signInStudentParams) async {
    if (await networkInfo.isConnected) {
      try {
        final AuthModel authModel =
            await autStudentRemoteDataSource.studentSignUp(signInStudentParams);
        authLocalDataSource.saveRole(authModel.user.role);
        authLocalDataSource.saveId(authModel.user.id);
        authLocalDataSource.saveName(authModel.user.userName);
        authLocalDataSource.saveToken(authModel.user.token,TypeUser.student);
        return right(authModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, AuthModel>> studentLogIn(
      LogInStudentParams logInStudentParams) async {
    if (await networkInfo.isConnected) {
      try {
        final AuthModel authModel =
            await autStudentRemoteDataSource.studentLogIn(logInStudentParams);
        authLocalDataSource.saveRole(authModel.user.role);
        authLocalDataSource.saveId(authModel.user.id);
        authLocalDataSource.saveName(authModel.user.userName);
        authLocalDataSource.saveToken(authModel.user.token,TypeUser.student);

        return right(authModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }
}
