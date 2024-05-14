import 'dart:io' hide HttpResponse;
import 'dart:typed_data';

import 'package:gamemuncheol/common/model/media_model.dart';
import 'package:gamemuncheol/common/service/image_picker/image_picker_service.dart';
import 'package:retrofit/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_api.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'feed_repository.g.dart';

@riverpod
FeedRepository feedRepository(FeedRepositoryRef ref) {
  final FeedApi feedApi = ref.read(feedApiProvider);
  final ImagePickerService imagePickerService =
      ref.read(imagePickerServiceProvider);

  return FeedRepositoryImpl(
      feedApi: feedApi, imagePickerService: imagePickerService);
}

abstract class FeedRepository {
  Future<Result<Match>> search(String gameId);
  Future<Result<File>> uploadVideo();
  Future<Result<Uint8List>> getByteThumbImage(File videoFile);
  Future<Result<Uint8List>> changeThumbNail();
  Future<Result<HttpResponse<List<int>>>> downloadThumbImage(String youtubeId);
}

class FeedRepositoryImpl implements FeedRepository {
  final FeedApi feedApi;
  final ImagePickerService imagePickerService;

  FeedRepositoryImpl({
    required this.feedApi,
    required this.imagePickerService,
  });

  @override
  Future<Result<Match>> search(String gameId) async {
    try {
      final CommonResponse<Match> matchHistory = await feedApi.search(gameId);
      return Success(matchHistory.data!);
    } catch (e) {
      return Failure(NoSuchMatch());
    }
  }

  @override
  Future<Result<File>> uploadVideo() async {
    try {
      final MediaModel? mediaModel =
          await imagePickerService.pickVideoFromGallery(maxByte: 500);

      if (mediaModel == null) {
        return Failure(VideoNotSelected());
      } else if (mediaModel.file == null) {
        return Failure(ByteOverFlow());
      }

      return Success(mediaModel.file!);
    } catch (e) {
      return Failure(UnSupportedFile());
    }
  }

  @override
  Future<Result<Uint8List>> changeThumbNail() async {
    try {
      final MediaModel? mediaModel =
          await imagePickerService.pickImageFromGallery(maxByte: null);

      if (mediaModel == null) {
        return Failure(ThumbImageNotSelected());
      }

      final Uint8List bytes = mediaModel.file!.readAsBytesSync();
      return Success(bytes);
    } catch (e) {
      return Failure(UnSupportedFile());
    }
  }

  @override
  Future<Result<Uint8List>> getByteThumbImage(File videoFile) async {
    try {
      final Uint8List? uint8List =
          await VideoThumbnail.thumbnailData(video: videoFile.path);

      if (uint8List == null) {
        return Failure(ThumbImageInitializeFailed());
      }

      return Success(uint8List);
    } catch (e) {
      return Failure(ThumbImageInitializeFailed());
    }
  }

  @override
  Future<Result<HttpResponse<List<int>>>> downloadThumbImage(
      String youtubeId) async {
    try {
      final HttpResponse<List<int>> thumbImageFile =
          await feedApi.downloadThumbImage(youtubeId);

      return Success(thumbImageFile);
    } catch (e) {
      return Failure(NoSuchYoutubeUrl());
    }
  }
}
