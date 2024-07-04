import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/location_search_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/search_model.dart';

import '../../../../core/error/feilurs.dart';
import '../../data/models/teachers_after_filter_model.dart';
import '../use_cases/filter_use_case.dart';
import '../use_cases/location_search_usecase.dart';
import '../use_cases/search_usecase.dart';

abstract class SearchAndFilterRepository {
  Future<Either<Failure, TeacherAfterFilterModel>> filterTeachers(FilterParams filterParams);
  Future<Either<Failure, SearchModel>> searchTeachers(SearchParams searchParams);
  Future<Either<Failure, FilterModel>> getFilterTeachers();
  Future<Either<Failure, LocationSearchModel>> locationSearch(SearchParam searchParam);


}