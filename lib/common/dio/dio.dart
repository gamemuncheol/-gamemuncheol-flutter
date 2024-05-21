// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/service/secure_storage/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/feature/auth/model/token_response.dart';

part 'dio.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final Dio dio = Dio();
  final FlutterSecureStorage storage = ref.watch(secureStorageProvider);
  final CustomInterceptor customInterceptor =
      CustomInterceptor(storage: storage);

  dio.interceptors.add(customInterceptor);
  return dio;
}

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({required this.storage});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint("[메소드: ${options.method}]");
    debugPrint("[베이스: ${options.baseUrl}]");
    debugPrint("[쿼리 스트링: ${options.path}]");
    debugPrint("[쿼리 파람: ${options.queryParameters}]");
    debugPrint("[바디: ${options.data}]");
    debugPrint("[헤더: ${options.headers}]");

    if (options.headers["customURL"] != null) {
      options = options.copyWith(baseUrl: options.headers["customURL"]);
      options.headers.remove("accessToken");
    }

    if (options.headers["accessToken"] == "true") {
      options.headers.remove("accessToken");
      final String? accessToken =
          await storage.read(key: AppData.ACCESS_TOKEN_KEY);

      options.headers.addAll({"Authorization": "Bearer $accessToken"});
    }

    debugPrint("[헤더: ${options.headers}]");

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("[응답: ${response.data}]");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    const String refreshPath = "member/renew";
    debugPrint("[에러 코드: ${err.response!.statusCode}]");
    debugPrint("[에러 헤더: ${err.response!.headers}]");
    debugPrint("[에러 바디: ${err.response!.data}]");

    final String? refreshToken =
        await storage.read(key: AppData.REFRESH_TOKEN_KEY);

    if (refreshToken == null) {
      return handler.reject(err);
    }

    final bool isStatus401 = err.response?.statusCode == 401;
    final bool isPathRefresh = err.requestOptions.path == refreshPath;

    if (isStatus401 && !isPathRefresh) {
      final dio = Dio();
      const String url =
          "https://api.gamemuncheol.com:8080/open-api/member/renew";

      try {
        final resp = await dio.post(url, data: {"refreshToken": refreshToken});
        final TokenResponse token = TokenResponse.fromJson(resp.data["data"]);

        final String newAccessToken = token.accessToken;
        final RequestOptions options = err.requestOptions;

        options.headers.addAll({"Authorization": "Bearer $newAccessToken"});
        await storage.write(
            key: AppData.ACCESS_TOKEN_KEY, value: newAccessToken);

        final newResp = await dio.fetch(options);

        return handler.resolve(newResp);
      } on DioException catch (e) {
        return handler.reject(e);
      }
    }

    return handler.reject(err);
  }
}
