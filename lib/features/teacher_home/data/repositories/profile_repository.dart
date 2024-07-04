import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/core/error/feilurs.dart';
import 'package:find_your_teacher/core/network/network.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/entities/teacher_entities.dart';
import 'package:find_your_teacher/features/teacher_home/domain/use_cases/avaible_forStudents.dart';
import 'package:find_your_teacher/features/teacher_home/domain/use_cases/phone_nmber_reset.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../../teacher auth/data/models/complete_registrer_model.dart';
import '../models/available_model.dart';
import '../data_sources/profile_remote.dart';
import 'package:find_your_teacher/features/teacher_home/domain/repositories/profile_repository.dart';

import '../models/profile_model.dart';
@LazySingleton(as:ProfileRepository)
class ProfileTeacherRepositoryImpl implements ProfileRepository {
  final ProfileRemote profileRemote;
  final NetworkInfo networkInfo;

  ProfileTeacherRepositoryImpl(
      {required this.profileRemote, required this.networkInfo});

  @override
  Future<Either<Failure, TeacherProfileModel>> getTeacherProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final getTeacherProfile = await profileRemote.getTeacherProfile();
        return right(getTeacherProfile);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, AvailableModel>> availableForStudents(
      AvailableForStudentsParams availableForStudentsParams) async {
    if (await networkInfo.isConnected) {
      try {
        final availableForStudents = await profileRemote.availableForStudents(
            availableForStudentsParams);
        return right(availableForStudents);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> phoneNumberReset(PhoneNumberResetParams phoneNumberResetParams) async{
    if (await networkInfo.isConnected) {
      try {
        final availableForStudents =
            await profileRemote.phoneNumberReset(phoneNumberResetParams);

        return right(availableForStudents);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }
}
