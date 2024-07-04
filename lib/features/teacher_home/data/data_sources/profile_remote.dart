import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:find_your_teacher/core/constants/base_url.dart';
import 'package:find_your_teacher/features/teacher_home/domain/use_cases/avaible_forStudents.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exceptions.dart';
import '../../../../core/error/exceptions.dart';
import '../../../student_auth/data/data_sources/local_data_source.dart';
import '../../../teacher auth/data/models/complete_registrer_model.dart';
import '../../../teacher auth/data/models/teacher_models.dart';
import '../../../teacher auth/domain/entities/teacher_entities.dart';
import '../../domain/use_cases/phone_nmber_reset.dart';
import '../models/available_model.dart';
import '../models/profile_model.dart';

abstract class ProfileRemote {
  ProfileRemote();

  Future<TeacherProfileModel> getTeacherProfile();

  Future<AvailableModel> availableForStudents(
      AvailableForStudentsParams availableForStudentsParams);
  Future<Unit> phoneNumberReset(PhoneNumberResetParams phoneNumberResetParams);
}
@LazySingleton(as:ProfileRemote)
class ProfileRemoteImpl implements ProfileRemote {
  final Dio dio;

  ProfileRemoteImpl({required this.dio});

  @override
  Future<TeacherProfileModel> getTeacherProfile() {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/users/profile/${await AuthImpLocalDataSource().getId()}",

      );
      if (response.statusCode == 200) {
        return TeacherProfileModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<AvailableModel> availableForStudents(
      AvailableForStudentsParams availableForStudentsParams) {
    return throwAppException(() async {
      final response = await dio.put(
        "$baseUrl/users/profile/${await AuthImpLocalDataSource().getId()}",data: availableForStudentsParams.map,
      );
      if (response.statusCode == 200) {
        return AvailableModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<Unit> phoneNumberReset(PhoneNumberResetParams phoneNumberResetParams) {
    return throwAppException(() async {
      final response = await dio.post(
        "$baseUrl/password/send_code",
      );
      if (response.statusCode == 201) {
        return Future.value(unit);
      } else {
        throw ServerException();
      }
    });
  }
}
