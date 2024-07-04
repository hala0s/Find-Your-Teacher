import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_your_teacher/core/constants/base_url.dart';
import 'package:find_your_teacher/core/error/app_exceptions.dart';
import 'package:find_your_teacher/features/student_auth/data/data_sources/local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'version_event.dart';

part 'version_state.dart';

@injectable
class VersionBloc extends Bloc<VersionEvent, VersionState> {
  VersionBloc() : super(VersionState(isOk: true)) {
    Dio dio = Dio();
    on<VersionEvent>((event, emit) async {
      return throwAppException(() async {
        try {
          Response response = await dio.get('$baseUrl/version/isVersionOk',
              queryParameters: {'version': event.version}).then((value) {
            emit(VersionState(isOk: value.data['isOk']));
            AuthImpLocalDataSource().isOkSave(value.data['isOk']);
            return value;
          });
        } catch (e) {
          print(e);
        }
      });
    });
  }
}
