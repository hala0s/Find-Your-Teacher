import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/location_model.dart';
import '../repositories/register_repository.dart';

@lazySingleton
class LocationUseCase{
  final AuthTeacherRepo authTeacherRepo;

  LocationUseCase({required this.authTeacherRepo});
  Future<Either<Failure,LocationModel>>call()async{
    return await authTeacherRepo.location();
  }

}