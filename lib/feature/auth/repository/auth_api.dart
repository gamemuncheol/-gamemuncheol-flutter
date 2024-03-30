import 'package:dio/dio.dart';
import 'package:gamemuncheol/feature/auth/model/token_response.dart';
import 'package:retrofit/retrofit.dart';

import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/feature/auth/model/apple_sign_in_request_body.dart';
import 'package:gamemuncheol/common/dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_api.g.dart';

@riverpod
AuthApi authApi(AuthApiRef ref) {
  final Dio dio = ref.read(dioProvider);
  return AuthApiImpl(dio, baseUrl: Data.BASE_URL);
}

abstract class AuthApi {
  Future<CommonResponse<TokenResponse>> signInWithApple(
    AppleSignInRequestBody appleSignInRequestBody,
  );
}

@RestApi()
abstract class AuthApiImpl implements AuthApi {
  factory AuthApiImpl(
    Dio dio, {
    String baseUrl,
  }) = _AuthApiImpl;

  @override
  @POST("/open-api/apple/sign-up")
  Future<CommonResponse<TokenResponse>> signInWithApple(
    @Body() AppleSignInRequestBody appleSignInRequestBody,
  );
}
