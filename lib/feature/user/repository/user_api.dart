import 'package:dio/dio.dart' hide Headers;
import 'package:gamemuncheol/feature/user/model/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/dio/dio.dart';
import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/model/common_response.dart';

part 'user_api.g.dart';

@riverpod
UserApi userApi(UserApiRef ref) {
  final Dio dio = ref.read(dioProvider);
  return UserApiImpl(dio, baseUrl: Data.BASE_URL);
}

abstract class UserApi {
  Future<CommonResponse> changeNickname(String nickname);
  Future<CommonResponse<bool>> isAgree();
  Future<CommonResponse<User>> agree();
  Future<CommonResponse<User>> me();
}

@RestApi()
abstract class UserApiImpl implements UserApi {
  factory UserApiImpl(Dio dio, {String baseUrl}) = _UserApiImpl;

  @override
  @Headers({"accessToken": "true"})
  @PATCH("/api/member/change-nickname/{nickname}")
  Future<CommonResponse> changeNickname(@Path() String nickname);

  @override
  @Headers({"accessToken": "true"})
  @GET("/privacy/is-agreed")
  Future<CommonResponse<bool>> isAgree();

  @override
  @Headers({"accessToken": "true"})
  @PATCH("/privacy/agree")
  Future<CommonResponse<User>> agree();

  @override
  @Headers({"accessToken": "true"})
  @GET("/api/member/me")
  Future<CommonResponse<User>> me();
}
