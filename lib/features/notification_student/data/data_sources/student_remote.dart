import 'package:dio/dio.dart';
import 'package:find_your_teacher/features/notification_student/data/models/notification_noti_model.dart';
import 'package:find_your_teacher/features/notification_student/domain/use_cases/notification_student_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/base_url.dart';
import '../../../../core/error/app_exceptions.dart';
import '../../../../core/error/exceptions.dart';
import '../../../student_auth/data/data_sources/local_data_source.dart';

abstract class StudentRemoteData{
  Future<NotificationStudentModels>notificationsStudent(StudentRoleParam studentRoleParam);

}
@LazySingleton(as: StudentRemoteData)
class StudentRemoteImpl implements StudentRemoteData{
  final Dio dio;

  StudentRemoteImpl({required this.dio});

  @override
  Future<NotificationStudentModels> notificationsStudent(StudentRoleParam studentRoleParam) {
    return throwAppException(() async {
      final response = await dio.get(
          "$baseUrl/notifications",
          options: Options(
            headers: {
              "Authorization":
              "Bearer ${await AuthImpLocalDataSource().getToken()}",
            },
          ),
          queryParameters: {
            "role": "student"
          }


      );
      if (response.statusCode == 200) {
        return NotificationStudentModels.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }


}

