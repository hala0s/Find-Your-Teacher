import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/teacher%20auth/data/models/complete_registrer_model.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/repositories/register_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';

@lazySingleton
class SecondRegisterUseCase {
  final AuthTeacherRepo authTeacherRepo;

  SecondRegisterUseCase({required this.authTeacherRepo});

  Future<Either<Failure, Unit>> call(
      SecondRegisterParams secondRegisterParams) async {
    return await authTeacherRepo.secondCompleteRegister(secondRegisterParams);
  }
}

class SecondRegisterParams {
  final String aboutMe;
  final List<String> subjects;
  final List<String> academicLevel;
  final List<String> locations;
  final int price;
  SecondRegisterParams(
      {required this.price,
      required this.aboutMe,
      required this.subjects,
      required this.locations,
      required this.academicLevel});
  Map<String, dynamic> get map => {
        "aboutMe": aboutMe,
        "subjects": subjects,
        "academicLevel": academicLevel,
        "locations": locations,
        "price": price,
      };
}
