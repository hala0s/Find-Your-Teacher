import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/search_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
@lazySingleton
class SearchUseCase {
  final SearchAndFilterRepository searchRepository;

  SearchUseCase({required this.searchRepository});
  Future<Either<Failure, SearchModel>> call(
      SearchParams searchParams
     ) async {
    return await searchRepository.searchTeachers(searchParams);
  }
}
class SearchParams {
  final String userName;
  final String role;

  SearchParams({required this.userName, required this.role});
  Map<String,dynamic> get map=>{
    "userName": userName,
    'role': role,

  };
}
