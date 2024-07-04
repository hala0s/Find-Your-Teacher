import 'package:dio/dio.dart';
import 'package:find_your_teacher/core/constants/base_url.dart';
import 'package:find_your_teacher/core/error/app_exceptions.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/location_search_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/search_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/domain/use_cases/filter_use_case.dart';
import 'package:find_your_teacher/features/search%20and%20filter/domain/use_cases/location_search_usecase.dart';
import 'package:find_your_teacher/features/search%20and%20filter/domain/use_cases/search_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/teachers_after_filter_model.dart';

abstract class SearchAndFilterRemote {
  Future<SearchModel> searchTeacher(SearchParams searchParams);

  Future<TeacherAfterFilterModel> filterTeacher(FilterParams filterParams);

  Future<FilterModel> getFilterTeacher();

  Future<LocationSearchModel> locationSearch(SearchParam searchParam);
}

@LazySingleton(as: SearchAndFilterRemote)
class SearchAndFilterRemoteImp implements SearchAndFilterRemote {
  final Dio dio;

  SearchAndFilterRemoteImp({required this.dio});

  @override
  Future<TeacherAfterFilterModel> filterTeacher(FilterParams filterParams) {
    return throwAppException(() async {
      try {
        final response = await dio.get(
          "$baseUrl/users/teachers",
          queryParameters: {
            "subjectIds": filterParams.subjectIds.toList(),
            "locationIds": filterParams.locationIds.toList(),
            "genderName": filterParams.genderName,
            "academicLevelIds": filterParams.academicLevelIds.toList(),
            "minPrice": filterParams.minPrice,
            "maxPrice": filterParams.maxPrice,
            "active": filterParams.active,
          },
        );

        if (response.statusCode == 200) {
          return TeacherAfterFilterModel.fromJson(response.data);
        } else {
          throw ServerException();
        }
      } on DioError catch (e) {
        if (e.response != null) {
          print("Dio Error Response: ${e.response!.data}");
        } else {
          print("Dio Error: ${e.message}");
        }
        throw ServerException();
      }
    });
  }

  @override
  Future<SearchModel> searchTeacher(SearchParams searchParams) {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/users/search-profile/",
        queryParameters: {
          "userName": searchParams.userName,
          "role": searchParams.role,
        },
      );
      if (response.statusCode == 200) {
        return SearchModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<FilterModel> getFilterTeacher() {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/users/filter_mobile",
      );
      if (response.statusCode == 200) {
        return FilterModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }

  @override
  Future<LocationSearchModel> locationSearch(SearchParam searchParam) {
    return throwAppException(() async {
      final response = await dio.get(
        "$baseUrl/locations",
        queryParameters: {
          "search" : searchParam.search
        }
      );
      if (response.statusCode == 200) {
        return LocationSearchModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    });
  }
}
