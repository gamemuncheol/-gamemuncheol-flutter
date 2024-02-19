import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/feature/auth/model/apple_sign_in_request_body.dart';
import 'package:gamemuncheol/common/dio/dio.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_api.g.dart';

@riverpod
AuthApi authApi(AuthApiRef ref) {
  final Dio dio = ref.read(
    dioProvider,
  );

  return AuthApiImpl(
    dio,
    baseUrl: BASE_URL,
  );
}

abstract class AuthApi {
  // 서버 단의 애플 로그인
  Future<SignInResponse> signInWithApple({
    required AppleSignInRequestBody appleSignInRequestBody,
  });
}

@RestApi()
abstract class AuthApiImpl implements AuthApi {
  factory AuthApiImpl(
    Dio dio, {
    String baseUrl,
  }) = _AuthApiImpl;

  @override
  @POST("/open-api/apple/sign-up/")
  Future<SignInResponse> signInWithApple({
    @Body() required AppleSignInRequestBody appleSignInRequestBody,
  });
}
