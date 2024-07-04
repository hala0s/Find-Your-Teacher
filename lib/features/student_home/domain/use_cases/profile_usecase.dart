import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/student_home/data/models/student_subjetcs_model.dart';
import 'package:find_your_teacher/features/student_home/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/teacher_by_sub_id_model.dart';

@lazySingleton
class StudentProfileUseCase {
  final StudentProfileRepository studentProfileRepository;

  StudentProfileUseCase({required this.studentProfileRepository});
  Future<Either<Failure,TeacherByIdModel>>call(SubjectIdParam subjectIdParam) async{
    return await studentProfileRepository.getTeacherById(subjectIdParam);
  }
}
class SubjectIdParam {
  final String subjectId;
  final bool? active;
  Map<String, dynamic> get map => {
    "subjectIds": subjectId,
    "active":active
  };
  SubjectIdParam({required this.subjectId,
     this.active=true,
  });

}
@lazySingleton
class StudentSubjectsUseCase {
  final StudentProfileRepository studentProfileRepository;
  Future<Either<Failure,GetStudentSubjectsModel>>call() async{
    return await studentProfileRepository.getStudentSubjects();
  }
  StudentSubjectsUseCase({required this.studentProfileRepository});

}
