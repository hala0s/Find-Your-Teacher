import 'package:dio/dio.dart';
import 'package:find_your_teacher/features/student_home/domain/use_cases/top_teachers_usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/base_url.dart';
import '../../../../core/error/app_exceptions.dart';
import '../../../../core/error/exceptions.dart';
import '../models/teacher_by_user_id_model.dart';
import '../models/top_teachers_model.dart';

abstract class TopTeachersRemote {
  Future<TopTeachersModel> getTopTeachers(ActiveParam activeParam);
  Future<TeacherByUserIdModel> getTopTeachersById(UserIdParam userIdParam);
}

@LazySingleton(as: TopTeachersRemote)
class TopTeachersRemoteImpl extends TopTeachersRemote {
  final Dio dio;

  TopTeachersRemoteImpl({required this.dio});

  @override
  Future<TopTeachersModel> getTopTeachers(ActiveParam activeParam) async {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/users/top-teacher",
        queryParameters: {
          "active": activeParam.active,
        }
      );
      if (response.statusCode == 200) {
        return TopTeachersModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<TeacherByUserIdModel> getTopTeachersById(UserIdParam userIdParam) {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/users/profile/${userIdParam.userId}",
      );
      if (response.statusCode == 200) {
        return TeacherByUserIdModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }
}
