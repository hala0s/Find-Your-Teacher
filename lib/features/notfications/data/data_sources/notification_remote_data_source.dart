import 'package:dio/dio.dart';
import 'package:find_your_teacher/features/notfications/domain/use_cases/notification_use_case.dart';
import 'package:find_your_teacher/features/student_auth/data/data_sources/local_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/base_url.dart';
import '../../../../core/error/app_exceptions.dart';
import '../../../../core/error/exceptions.dart';
import '../models/notifications_model.dart';

abstract class NotificationRemoteDataSource {
  const NotificationRemoteDataSource();
  Future<NotificationModels>notifications(RoleParam roleParam);
 }
 @LazySingleton(as: NotificationRemoteDataSource)
 class NotificationImpRemoteDataSource implements NotificationRemoteDataSource{
  final Dio dio;

  NotificationImpRemoteDataSource({required this.dio});


  @override
  Future<NotificationModels> notifications(RoleParam roleParam) {
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
          "role": "teacher"
        }


      );
      if (response.statusCode == 200) {
        return NotificationModels.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }


}

