import 'package:dartz/dartz.dart';

import 'package:find_your_teacher/core/error/feilurs.dart';

import 'package:find_your_teacher/features/notfications/domain/entities/notiication_entity.dart';
import 'package:find_your_teacher/features/notfications/domain/use_cases/notification_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network.dart';
import '../../domain/repositories/notfications_domain.dart';
import '../data_sources/notification_remote_data_source.dart';
import '../models/notifications_model.dart';
@LazySingleton(as:NotificationRepoDomain)
class NotificationImp implements NotificationRepoDomain{
  final NotificationRemoteDataSource notificationRemoteDataSource;
  final NetworkInfo netWorkInfo;

  NotificationImp({required this.notificationRemoteDataSource, required this.netWorkInfo});

  @override
  Future<Either<Failure, NotificationModels>> notifications(RoleParam roleParam) async{
    if (await netWorkInfo.isConnected) {
      try {
        final notifications =
            await notificationRemoteDataSource.notifications(roleParam);
        return right(notifications);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }
}