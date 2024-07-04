import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:find_your_teacher/core/constants/base_url.dart';
import 'package:find_your_teacher/features/student_auth/data/models/studentModels.dart';
import 'package:find_your_teacher/features/student_auth/domain/use_cases/log_in_student.dart';
import 'package:find_your_teacher/features/student_auth/domain/use_cases/sign_up_student.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../core/error/app_exceptions.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/auth_entities.dart';
import 'package:injectable/injectable.dart';

abstract class AutStudentRemoteDataSource {
  const AutStudentRemoteDataSource();

  Future<AuthModel> studentSignUp(SignUpStudentParams signInStudentParams);

  Future<AuthModel> studentLogIn(LogInStudentParams logInStudentParams);
}

@LazySingleton(as: AutStudentRemoteDataSource)
class AutStudentRemoteDataSourceImp implements AutStudentRemoteDataSource {
  final Dio dio;

  AutStudentRemoteDataSourceImp({required this.dio}) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  @override
  Future<AuthModel> studentSignUp(SignUpStudentParams signInStudentParams) {
    return throwAppException(() async {
      SignUpStudentParams signUppStudentParams = SignUpStudentParams(
          studentName: signInStudentParams.studentName,
          gender: signInStudentParams.gender,
          fcmToken: await FirebaseMessaging.instance.getToken(),
          studentPhoneNumber: signInStudentParams.studentPhoneNumber,
          studentPassword: signInStudentParams.studentPassword,
          role: signInStudentParams.role);
      final response = await dio.post(
        "$baseUrl/auth/register",
        data: signUppStudentParams.map,
      );
      if (response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<AuthModel> studentLogIn(LogInStudentParams logInStudentParams) {
    return throwAppException(() async {
      LogInStudentParams logInnStudentParams = LogInStudentParams(
        studentPhoneNumber: logInStudentParams.studentPhoneNumber,
        studentPassword: logInStudentParams.studentPassword,
        fcmToken: await FirebaseMessaging.instance.getToken(),);
      final response = await dio.post(
        "$baseUrl/auth/login",
        data: logInnStudentParams.map,
      );
      if (response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }
}
