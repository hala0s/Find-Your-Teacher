import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/repositories/register_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
@lazySingleton
class CompleteTeacherProfileUseCase1 {
  final AuthTeacherRepo authTeacherRepo;

  CompleteTeacherProfileUseCase1({required this.authTeacherRepo});
  Future<Either<Failure,Unit>>call(CompleteTeacherParams completeTeacherParams)async{
    return await authTeacherRepo.completeTeacherProfile1(completeTeacherParams);
  }

}

class CompleteTeacherParams {
  final File? teacherImage;
  final String teacherFullName;
  final String teacherBirth;
  final String ?teacherGender;

  CompleteTeacherParams(
      {required this.teacherImage,
      required this.teacherFullName,
      required this.teacherBirth,
      required this.teacherGender,
    });
  Map<String,dynamic>get map=>{
    "image":teacherImage,
    'userName':teacherFullName,
    'birthday':teacherBirth,
    'gender':teacherGender,

  };
}
