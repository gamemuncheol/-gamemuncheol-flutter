import 'package:dio/dio.dart' hide Headers;
import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/dio/dio.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';

part 'feed_api.g.dart';

@riverpod
FeedApi feedApi(FeedApiRef ref) {
  final Dio dio = ref.read(dioProvider);
  return FeedApiImpl(dio, baseUrl: Data.BASE_URL);
}

abstract class FeedApi {
  Future<CommonResponse<MatchHistory>> search(String gameId);
}

@RestApi()
abstract class FeedApiImpl implements FeedApi {
  factory FeedApiImpl(
    Dio dio, {
    String baseUrl,
  }) = _FeedApiImpl;

  @override
  @Headers({"accessToken": "true"})
  @GET("/api/board/search-match/{gameId}")
  Future<CommonResponse<MatchHistory>> search(@Path() String gameId);
}
