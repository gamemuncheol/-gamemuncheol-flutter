import 'dart:io' hide HttpResponse;
import 'dart:typed_data';

import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:retrofit/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/state/video_upload_state.dart';
import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_repository.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'video_upload_provider.g.dart';

@riverpod
class VideoUploadNotifier extends _$VideoUploadNotifier {
  @override
  StateMapper<VideoUploadState> build() => StateMapper.init();

  void clearCache() {
    state = StateMapper.init();
  }

  Future<bool> uploadVideo() async {
    final FeedRepository feedRepository = ref.read(feedRepositoryProvider);

    state = LoadingState(message: "동영상 업로드 중..");
    Result<File> videoFile = await feedRepository.uploadVideo();

    return videoFile.when(
      success: (videoFile) async {
        final Result<Uint8List> byteThumbImage =
            await feedRepository.getByteThumbImage(videoFile);

        byteThumbImage.when(
          success: (byteThumbImage) => state = VideoFileSelected(
            videoFile: videoFile,
            byteThumbImage: byteThumbImage,
          ),
          // 비디오는 선택됐는데 썸네일을 자동으로 불러올 수 없음
          failure: (error) => state = VideoFileSelected(videoFile: videoFile),
        );

        return true;
      },
      failure: (error) {
        state = ErrorState(error);
        return false;
      },
    );
  }

  Future<void> enterYoutubeUrl(
    String youtubeUrl, {
    required String? Function(String? value) validator,
  }) async {
    state = LoadingState();

    final String? errorMessage = validator(youtubeUrl);
    if (errorMessage != null) {
      state = ErrorState(NoSuchYoutubeUrl());
      return;
    }

    final String? youtubeId = YoutubePlayer.convertUrlToId(youtubeUrl);
    if (youtubeId == null) {
      state = ErrorState(NoSuchYoutubeUrl());
      return;
    }

    final List<int>? intList = await _downloadThumbImage(youtubeId);
    if (intList == null) {
      state = ErrorState(NoSuchYoutubeUrl());
      return;
    }

    state = YoutubeUrlSelected(
      youtubeUrl: youtubeUrl,
      byteThumbImage: Uint8List.fromList(intList),
    );

    return;
  }

  Future<List<int>?> _downloadThumbImage(String youtubeId) async {
    final FeedRepository feedRepository = ref.read(feedRepositoryProvider);

    final Result<HttpResponse<List<int>>> thumbImageFile =
        await feedRepository.downloadThumbImage(youtubeId);

    return thumbImageFile.when(
      success: (thumbImageFile) => thumbImageFile.data,
      failure: (error) => null,
    );
  }
}
