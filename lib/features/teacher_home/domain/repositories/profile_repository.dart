import 'package:dartz/dartz.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/available_model.dart';
import '../../data/models/profile_model.dart';
import '../use_cases/avaible_forStudents.dart';
import '../use_cases/phone_nmber_reset.dart';

abstract class ProfileRepository {
  Future<Either<Failure, TeacherProfileModel>> getTeacherProfile();

  Future<Either<Failure, AvailableModel>> availableForStudents(
      AvailableForStudentsParams availableForStudentsParams);

  Future<Either<Failure, Unit>> phoneNumberReset(
      PhoneNumberResetParams phoneNumberResetParams);
}
