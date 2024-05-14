import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/dio/dio.dart';
import 'package:gamemuncheol/common/const/data.dart';

part 'auth_api.g.dart';

@riverpod
AuthApi authApi(AuthApiRef ref) {
  final Dio dio = ref.read(dioProvider);
  return AuthApiImpl(dio, baseUrl: AppData.BASE_URL);
}

abstract class AuthApi {}

@RestApi()
abstract class AuthApiImpl implements AuthApi {
  factory AuthApiImpl(
    Dio dio, {
    String baseUrl,
  }) = _AuthApiImpl;
}
