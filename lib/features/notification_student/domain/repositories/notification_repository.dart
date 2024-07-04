import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/notification_student/data/models/notification_noti_model.dart';

import '../../../../core/error/feilurs.dart';
import '../use_cases/notification_student_usecase.dart';
abstract class NotificationStudentRepository {
  Future<Either<Failure, NotificationStudentModels>> notificationStudent(StudentRoleParam
studentRoleParam
);
}