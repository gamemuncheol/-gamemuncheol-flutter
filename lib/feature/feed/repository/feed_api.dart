import 'package:dio/dio.dart' hide Headers;
import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/dio/dio.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';

part 'feed_api.g.dart';

@riverpod
FeedApi feedApi(FeedApiRef ref) {
  final Dio dio = ref.read(dioProvider);
  return FeedApiImpl(dio, baseUrl: AppData.BASE_URL);
}

abstract class FeedApi {
  Future<CommonResponse<Match>> search(String gameId);
  Future<HttpResponse<List<int>>> downloadThumbImage(String youtubeId);
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
  Future<CommonResponse<Match>> search(@Path() String gameId);

  @override
  @Headers({"customURL": "https://img.youtube.com/vi"})
  @GET("/{youtubeId}/0.jpg")
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadThumbImage(@Path() String youtubeId);
}
