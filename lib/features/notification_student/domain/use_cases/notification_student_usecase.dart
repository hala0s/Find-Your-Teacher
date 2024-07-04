import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/notification_student/data/models/notification_noti_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../repositories/notification_repository.dart';

@lazySingleton
class NotificationsStudentUseCase {
  final NotificationStudentRepository notificationStudentRepository;
  NotificationsStudentUseCase({required this.notificationStudentRepository});

  Future<Either<Failure,NotificationStudentModels>> call(StudentRoleParam studentRoleParam) async {
    return await notificationStudentRepository.notificationStudent(studentRoleParam);
  }
}
class StudentRoleParam {
  final String roleParam;

  StudentRoleParam({required this.roleParam});
  Map<String,dynamic> get map=>{
    "role" : roleParam,
  };
}