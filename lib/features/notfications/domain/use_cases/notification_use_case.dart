import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/notfications/data/models/notifications_model.dart';
import 'package:find_your_teacher/features/notfications/domain/repositories/notfications_domain.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/feilurs.dart';
import '../entities/notiication_entity.dart';

@lazySingleton
class NotificationsUseCase {
  final NotificationRepoDomain notificationDomain;
  NotificationsUseCase({required this.notificationDomain});

  Future<Either<Failure,NotificationModels>> call(RoleParam roleParam) async {
    return await notificationDomain.notifications(roleParam);
  }
}
class RoleParam {
  final String roleParam;

  RoleParam({required this.roleParam});
  Map<String,dynamic> get map=>{
    "role" : roleParam,
  };
}