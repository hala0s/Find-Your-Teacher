import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:find_your_teacher/core/constants/base_url.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:find_your_teacher/features/teacher%20auth/data/models/activate_teacher_model.dart';
import 'package:find_your_teacher/features/teacher%20auth/data/models/get_teacher_profile.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/use_cases/login_teacher.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/use_cases/sign_up_teacher.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/use_cases/teacher_activate_usecase.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/app_exceptions.dart';
import '../../../../core/error/exceptions.dart';
import '../../../student_auth/data/data_sources/local_data_source.dart';
import '../../../student_auth/data/models/studentModels.dart';
import '../../domain/entities/get_teacher_profile.dart';
import '../../domain/use_cases/complete_profile2.dart';
import '../../domain/use_cases/complete_teacher_profile_1.dart';
import '../models/location_model.dart';

abstract class AuthTeacherRemoteDataSource {
  AuthTeacherRemoteDataSource();

  Future<AuthModel> teacherSigUp(TeacherSignUpParams teacherSignUpParams);

  Future<AuthModel> teacherLogIn(TeacherLogInParams teacherLogInParams);

  Future<GetTeacherProfileEntities> getTeacherProfileBeforeComplete();

  Future<Unit> completeTeacherProfile1(
      CompleteTeacherParams completeTeacherParams);

  Future<Unit> secondCompleteRegister(
      SecondRegisterParams secondRegisterParams);

  Future<LocationModel> location();

  Future<FilterModel> getCompleteRegister();

  Future<TeacherActivateModel> teacherActivate(IdParam idParam);
}

@LazySingleton(as: AuthTeacherRemoteDataSource)
class AutTeacherRemoteDataSourceImp implements AuthTeacherRemoteDataSource {
  final Dio dio;

  AutTeacherRemoteDataSourceImp({required this.dio}) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  @override
  Future<AuthModel> teacherSigUp(TeacherSignUpParams teacherSignUpParams) {
    return throwAppException(() async {
      TeacherSignUpParams teacherSignUppParams = TeacherSignUpParams(
          teacherName: teacherSignUpParams.teacherName,
          fcmToken: await FirebaseMessaging.instance.getToken(),
          teacherGender: teacherSignUpParams.teacherGender,
          teacherPhone: teacherSignUpParams.teacherPhone,
          teacherPassword: teacherSignUpParams.teacherPassword,
          role: teacherSignUpParams.role);
      final response = await dio.post(
        "$baseUrl/auth/register",
        data: teacherSignUppParams.map,
      );
      if (response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<AuthModel> teacherLogIn(TeacherLogInParams teacherLogInParams) {
    return throwAppException(() async {
      TeacherLogInParams teacherLogInnParams = TeacherLogInParams(
        password: teacherLogInParams.password,
        teacherPhone: teacherLogInParams.teacherPhone,
        fcmToken: await FirebaseMessaging.instance.getToken(),
      );
      final response = await dio.post(
        "$baseUrl/auth/login",
        data: teacherLogInnParams.map,
      );
      if (response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<GetTeacherProfileEntities> getTeacherProfileBeforeComplete() {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/users/profile/${await AuthImpLocalDataSource().getId()}",
      );
      if (response.statusCode == 200) {
        print(response.data);
        return GetTeacherProfileModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<Unit> completeTeacherProfile1(
      CompleteTeacherParams completeTeacherParams) async {
    final file = completeTeacherParams.teacherImage;
    String fileName = file!.path.split('/').last;

    FormData formData = FormData.fromMap({
      // Ensure the field name matches the server's expected field name
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: MediaType('image', 'jpeg'),
      ),
      'userName': completeTeacherParams.teacherFullName,
      'birthday': completeTeacherParams.teacherBirth,
      'gender': completeTeacherParams.teacherGender,
    });

    try {
      final response = await dio.put(
        '$baseUrl/users/profile/${await AuthImpLocalDataSource().getId()}',
        data: formData,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${await AuthImpLocalDataSource().getToken()}",
            'Content-Type': 'multipart/form-data'
          },
        ),
      );
      if (response.statusCode == 200) {
        return Future.value(unit);
      } else {
        // Handle unexpected status codes
        throw DioException(
          response: response,
          requestOptions: RequestOptions(
            path: '',
          ),
        );
      }
    } on DioError catch (e) {
      // Handle DioError specifically
      throw Exception('Dio error: ${e.message}');
    }
  }

  @override
  Future<LocationModel> location() {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/users/profile/"
        "${await AuthImpLocalDataSource().getId()}",
      );
      if (response.statusCode == 200) {
        return LocationModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<Unit> secondCompleteRegister(
      SecondRegisterParams secondRegisterParams) {
    return throwAppException(() async {
      final response = await dio.put(
        "$baseUrl/users/profile/${await AuthImpLocalDataSource().getId()}",
        data: secondRegisterParams.map,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${await AuthImpLocalDataSource().getToken()}",
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return Future.value(unit);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<FilterModel> getCompleteRegister() {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/users/filter_mobile",
      );
      if (response.statusCode == 200) {
        return FilterModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<TeacherActivateModel> teacherActivate(IdParam idParam) {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/users/active/ok/${await AuthImpLocalDataSource().getId()}",
      );
      if (response.statusCode == 200) {
        return TeacherActivateModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }
}
