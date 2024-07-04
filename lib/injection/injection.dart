import 'dart:io';
import 'package:find_your_teacher/injection/injection.config.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

@module
abstract class AppModule {
  BaseOptions get dioOption => BaseOptions(
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 50),
        headers: <String, String>{
          HttpHeaders.acceptHeader: 'application/json',
        },
      );

  @singleton
  Logger get logger => Logger();

  @lazySingleton
  Dio dio(BaseOptions option, Logger logger) {
    final dio = Dio(option);
    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          //options.headers["Authorization"] =
          //  "Bearer ${await AuthImplLocalDataSource().getToken()}";
          return handler.next(options);
        },
        onResponse:
            (Response response, ResponseInterceptorHandler handler) async {
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          return handler.next(e);
        },
      ),
    ]);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    // ]);
    return dio;
  }
}
