import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/dio/dio.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_api.g.dart';

@riverpod
FeedApi feedApi(FeedApiRef ref) {
  final Dio dio = ref.read(dioProvider);
  return FeedApiImpl(dio, baseUrl: Data.BASE_URL);
}

abstract class FeedApi {
  Future<MatchHistory> search({required String gameId});
}

@RestApi()
abstract class FeedApiImpl implements FeedApi {
  factory FeedApiImpl(
    Dio dio, {
    String baseUrl,
  }) = _FeedApiImpl;

  @override
  @GET("/api/board/searchMatch/{gameId}")
  Future<MatchHistory> search({@Path() required String gameId});
}
