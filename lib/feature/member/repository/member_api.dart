import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/common/repository/dio/dio.dart';
import 'package:gamemuncheol/feature/member/model/member.dart';

part 'member_api.g.dart';

@riverpod
MemberApi memberApi(MemberApiRef ref) {
  final Dio dio = ref.read(dioProvider);
  return MemberApiImpl(dio, baseUrl: AppData.BASE_URL);
}

abstract class MemberApi {
  Future<CommonResponse> changeNickname(String nickname);
  Future<CommonResponse<bool>> isAgree();
  Future<CommonResponse<Member>> agree();
  Future<CommonResponse<Member>> me();
}

@RestApi()
abstract class MemberApiImpl implements MemberApi {
  factory MemberApiImpl(Dio dio, {String baseUrl}) = _MemberApiImpl;

  @override
  @Headers({"accessToken": "true"})
  @PATCH("/api/member/change-nickname/{nickname}")
  Future<CommonResponse> changeNickname(@Path() String nickname);

  @override
  @Headers({"accessToken": "true"})
  @GET("/privacy")
  Future<CommonResponse<bool>> isAgree();

  @override
  @Headers({"accessToken": "true"})
  @PATCH("/privacy")
  Future<CommonResponse<Member>> agree();

  @override
  @Headers({"accessToken": "true"})
  @GET("/api/member/me")
  Future<CommonResponse<Member>> me();
}
