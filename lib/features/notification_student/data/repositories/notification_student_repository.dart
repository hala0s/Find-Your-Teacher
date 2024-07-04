import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/core/error/feilurs.dart';
import 'package:find_your_teacher/features/notification_student/data/data_sources/student_remote.dart';
import 'package:find_your_teacher/features/notification_student/data/models/notification_noti_model.dart';
import 'package:find_your_teacher/features/notification_student/domain/use_cases/notification_student_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network.dart';
import '../../domain/repositories/notification_repository.dart';

@LazySingleton(as:NotificationStudentRepository)
class StudentNotificationImp implements NotificationStudentRepository {
  final StudentRemoteData studentNotificationImpRemoteDataSource;
  final NetworkInfo netWorkInfo;

  StudentNotificationImp(
      {required this.studentNotificationImpRemoteDataSource, required this.netWorkInfo});


  @override
  Future<Either<Failure, NotificationStudentModels>> notificationStudent(
      StudentRoleParam studentRoleParam) async
  {
    if (await netWorkInfo.isConnected) {
      try {
        final notifications =
        await studentNotificationImpRemoteDataSource.notificationsStudent(
            studentRoleParam);
        return right(notifications);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }
}