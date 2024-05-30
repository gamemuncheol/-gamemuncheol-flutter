import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:gamemuncheol/feature/feed/model/feed.dart';
import 'package:gamemuncheol/feature/feed/model/feed_form.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/common/repository/dio/dio.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';

part 'feed_api.g.dart';

@riverpod
FeedApi feedApi(FeedApiRef ref) {
  final Dio dio = ref.read(dioProvider);
  return FeedApiImpl(dio: dio, baseUrl: AppData.BASE_URL);
}

abstract class FeedApi {
  Future<CommonResponse<Match>> search(String gameId);
  Future<HttpResponse<List<int>>> getYoutubeThumbImage(String youtubeId);
  Future<String> uploadVideo(File videoFile);
  Future<String> uploadThumbImage(File thumbImageFile);
  Future<CommonResponse<Feed>> post(FeedForm feedForm);
}

class FeedApiImpl implements FeedApi {
  final Dio _dio;
  final String _baseUrl;

  final FeedApiImplProxy retrofit;

  FeedApiImpl({required Dio dio, required String baseUrl})
      : _dio = dio,
        _baseUrl = baseUrl,
        retrofit = FeedApiImplProxy(dio, baseUrl: baseUrl);

  @override
  Future<CommonResponse<Match>> search(String gameId) async {
    return retrofit.search(gameId);
  }

  @override
  Future<HttpResponse<List<int>>> getYoutubeThumbImage(String youtubeId) async {
    return retrofit.getYoutubeThumbImage(youtubeId);
  }

  @override
  Future<String> uploadVideo(File videoFile) async {
    final String url = "$_baseUrl/api/file/video";

    final part = await MultipartFile.fromFile(
      videoFile.path,
      filename: videoFile.path
          .split(
            Platform.pathSeparator,
          )
          .last,
      contentType: MediaType(
        "video",
        "mp4",
      ),
    );

    final response = await _dio.post(
      url,
      data: FormData.fromMap({
        "file": part,
      }),
      options: Options(
        headers: {
          "accessToken": "true",
          "Content-Type": "multipart/form-data",
        },
      ),
    );

    return response.data;
  }

  @override
  Future<String> uploadThumbImage(File thumbImageFile) async {
    final String url = "$_baseUrl/api/file/thumbnail";

    final part = await MultipartFile.fromFile(
      thumbImageFile.path,
      filename: thumbImageFile.path
          .split(
            Platform.pathSeparator,
          )
          .last,
      contentType: MediaType(
        "image",
        "jpeg",
      ),
    );

    final response = await _dio.post(
      url,
      data: FormData.fromMap({
        "file": part,
      }),
      options: Options(
        headers: {
          "accessToken": "true",
          "Content-Type": "multipart/form-data",
        },
      ),
    );

    return response.data;
  }

  @override
  Future<CommonResponse<Feed>> post(FeedForm feedForm) {
    return retrofit.post(feedForm);
  }
}

@RestApi()
abstract class FeedApiImplProxy implements FeedApi {
  factory FeedApiImplProxy(
    Dio dio, {
    String baseUrl,
  }) = _FeedApiImplProxy;

  @override
  @Headers({"accessToken": "true"})
  @GET("/api/riot/search-match/{gameId}")
  Future<CommonResponse<Match>> search(@Path() String gameId);

  @override
  @Headers({"customURL": "https://img.youtube.com/vi"})
  @GET("/{youtubeId}/0.jpg")
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getYoutubeThumbImage(
      @Path() String youtubeId);

  @override
  @Headers({"accessToken": "true"})
  @POST("/api/post/video-upload")
  @MultiPart()
  Future<String> uploadVideo(@Part() File videoFile);

  @override
  @Headers({"accessToken": "true"})
  @POST("/api/post/thumbnail-upload")
  @MultiPart()
  Future<String> uploadThumbImage(
      @Part(name: "file", contentType: 'image/jpg') File thumbImageFile);

  @override
  @Headers({"accessToken": "true", "Content-Type": "application/json"})
  @POST("/api/post")
  Future<CommonResponse<Feed>> post(@Body() FeedForm feedForm);
}
