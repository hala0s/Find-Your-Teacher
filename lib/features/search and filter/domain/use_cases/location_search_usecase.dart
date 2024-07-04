import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/location_search_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../repositories/search_repository.dart';

@lazySingleton
class LocationSearchUseCase {
  final SearchAndFilterRepository searchRepository;

  LocationSearchUseCase({required this.searchRepository});
  Future<Either<Failure, LocationSearchModel>> call(
      SearchParam searchParam
      ) async {
    return await searchRepository.locationSearch(searchParam);
  }
}
class SearchParam {
  final String search;

  SearchParam({required this.search, });
  Map<String,dynamic> get map=>{
    "search": search,

  };
}
