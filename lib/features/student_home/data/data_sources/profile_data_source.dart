import 'package:dio/dio.dart';
import 'package:find_your_teacher/core/constants/base_url.dart';
import 'package:find_your_teacher/features/student_home/data/models/student_profile_model.dart';
import 'package:find_your_teacher/features/student_home/data/models/student_subjetcs_model.dart';
import 'package:find_your_teacher/features/student_home/data/models/take_number_model.dart';
import 'package:find_your_teacher/features/student_home/domain/use_cases/profile_usecase.dart';
import 'package:find_your_teacher/features/student_home/domain/use_cases/student_profile_usecase.dart';
import 'package:find_your_teacher/features/student_home/domain/use_cases/take_number_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exceptions.dart';
import '../../../../core/error/exceptions.dart';
import '../../../student_auth/data/data_sources/local_data_source.dart';
import '../models/teacher_by_sub_id_model.dart';

abstract class StudentProfileRemote {
  Future<TeacherByIdModel> getTeacherByIdProfile(SubjectIdParam subjectIdParam);

  Future<GetStudentSubjectsModel> getStudentSubjects();

  Future<TakeNumberModel> takeTeacherNumber(UserIdParam userIdParam);

  Future<StudentProfileModel> getStudentProfile(StudentIdParam studentIdParam);
}

@LazySingleton(as: StudentProfileRemote)
class StudentProfileRemoteImpl implements StudentProfileRemote {
  final Dio dio;

  StudentProfileRemoteImpl({required this.dio});

  @override
  Future<TeacherByIdModel> getTeacherByIdProfile(
      SubjectIdParam subjectIdParam) {
    return throwAppException(() async {
      final response =
          await dio.get("$baseUrl/users/teachers", queryParameters: {
        "active": subjectIdParam.active,
        "subjectIds": subjectIdParam.subjectId,
      });
      if (response.statusCode == 200) {
        return TeacherByIdModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<GetStudentSubjectsModel> getStudentSubjects() {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/subjects",

      );
      if (response.statusCode == 200) {
        return GetStudentSubjectsModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<TakeNumberModel> takeTeacherNumber(UserIdParam userIdParam) {
    return throwAppException(() async {
      final response = await dio.get("$baseUrl/users/number",
          options: Options(
            headers: {
              "Authorization":
                  "Bearer ${await AuthImpLocalDataSource().getToken()}",
            },
          ),
          queryParameters: {
            "userId": userIdParam.userId,
          });
      if (response.statusCode == 200) {
        return TakeNumberModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<StudentProfileModel> getStudentProfile(StudentIdParam studentIdParam) {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/users/profile/student/${await AuthImpLocalDataSource().getId()}",
      );

      if (response.statusCode == 200) {
        return StudentProfileModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }
}
