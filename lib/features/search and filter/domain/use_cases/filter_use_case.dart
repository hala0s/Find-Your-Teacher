import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/teachers_after_filter_model.dart';

@lazySingleton
class FilterTeacherUseCase {
  final SearchAndFilterRepository searchRepository;

  FilterTeacherUseCase({required this.searchRepository});

  Future<Either<Failure, TeacherAfterFilterModel>> call(
      FilterParams filterParams) async {
    return await searchRepository.filterTeachers(filterParams);
  }
}

class FilterParams {
  final List<String> subjectIds;
  final List<String> locationIds;
  final List<String> academicLevelIds;
  final String genderName;
  final int maxPrice;
  final int minPrice = 0;
  final bool active;
  FilterParams({
    required this.active,
    required this.maxPrice,
    required this.subjectIds,
    required this.locationIds,
    required this.academicLevelIds,
    required this.genderName,
  });

  Map<String, dynamic> get map => {
        "subjectIds": subjectIds,
        "locationIds": locationIds,
        "academicLevelId": academicLevelIds,
        "genderName": genderName,
        "maxPrice": maxPrice,
        "minPrice": 0,
        "active": active,
      };
}

@lazySingleton
class GetFilterUseCase {
  final SearchAndFilterRepository searchAndFilterRepository;

  GetFilterUseCase({required this.searchAndFilterRepository});

  Future<Either<Failure, FilterModel>> call() async {
    return await searchAndFilterRepository.getFilterTeachers();
  }
}
