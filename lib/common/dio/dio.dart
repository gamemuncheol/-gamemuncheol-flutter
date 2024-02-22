import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final Dio dio = Dio();
  final CustomInterceptor customInterceptor = CustomInterceptor();

  dio.interceptors.add(
    customInterceptor,
  );

  return dio;
}

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("[베이스 URL - ${options.baseUrl}]");

    print("[패스 - ${options.path}]");

    print("[요청 데이터 - ${options.data}]");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("[에러 메세지 - ${err.message}]");

    super.onError(err, handler);
  }
}
