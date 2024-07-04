import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/core/error/feilurs.dart';
import 'package:find_your_teacher/core/network/network.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/data_sources/search_remote.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/location_search_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/search_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/domain/repositories/search_repository.dart';
import 'package:find_your_teacher/features/search%20and%20filter/domain/use_cases/filter_use_case.dart';
import 'package:find_your_teacher/features/search%20and%20filter/domain/use_cases/location_search_usecase.dart';
import 'package:find_your_teacher/features/search%20and%20filter/domain/use_cases/search_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/teachers_after_filter_model.dart';


@LazySingleton(as:SearchAndFilterRepository)

class SearchAndFilterRepositoryImpl implements SearchAndFilterRepository {
  final SearchAndFilterRemote searchAndFilterRemote;
  final NetworkInfo networkInfo;

  SearchAndFilterRepositoryImpl(
      {required this.searchAndFilterRemote, required this.networkInfo});

  @override
  Future<Either<Failure, TeacherAfterFilterModel>> filterTeachers(
      FilterParams filterParams) async {
    if (await networkInfo.isConnected) {
      try {
        final TeacherAfterFilterModel filterModel =
        await searchAndFilterRemote.filterTeacher(filterParams);
        return right(filterModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, SearchModel>> searchTeachers(
      SearchParams searchParams) async {
    if (await networkInfo.isConnected) {
      try {
        final SearchModel search =
        await searchAndFilterRemote.searchTeacher(searchParams);
        return right(search);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, FilterModel>> getFilterTeachers() async {
    if (await networkInfo.isConnected) {
      try {
        final FilterModel filterModel =
        await searchAndFilterRemote.getFilterTeacher();
        return right(filterModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, LocationSearchModel>> locationSearch(
      SearchParam searchParam) async {
    if (await networkInfo.isConnected) {
      try {
        final LocationSearchModel locationSearchModel =
        await searchAndFilterRemote.locationSearch(searchParam);
        return right(locationSearchModel);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(EmptyCacheFailure());
    }
  }
}