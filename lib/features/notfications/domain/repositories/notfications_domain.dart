import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/notfications/data/models/notifications_model.dart';

import '../../../../core/error/feilurs.dart';
import '../use_cases/notification_use_case.dart';
 abstract class NotificationRepoDomain{
Future<Either<Failure,NotificationModels>>notifications(RoleParam roleParam);
}
