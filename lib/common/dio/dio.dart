import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
    debugPrint("[베이스: ${options.baseUrl}]");
    debugPrint("[쿼리 스트링: ${options.path}]");
    debugPrint("[쿼리 파람: ${options.queryParameters}]");
    debugPrint("[바디: ${options.data}]");

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("[에러 메세지 - ${err.message}]");

    super.onError(err, handler);
  }
}
