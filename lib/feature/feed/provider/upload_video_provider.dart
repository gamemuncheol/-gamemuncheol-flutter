import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/state/upload_video_state.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_repository.dart';

part 'upload_video_provider.g.dart';

@riverpod
class UploadVideoNotifer extends _$UploadVideoNotifer {
  @override
  BaseState<VideoUploadState> build() => BaseState.init();

  Future<bool> uploadVideo() async {
    state = LoadingState(message: "동영상 업로드 중..");
    Result<File> videoFile =
        await ref.read(feedRepositoryProvider).uploadVideo();

    return videoFile.when(success: (videoFile) {
      state = VideoFileSelected(videoFile: videoFile);
      return true;
    }, failure: (error) {
      state = ErrorState(message: error.message);
      return false;
    });
  }

  void clearCache() {
    state = BaseState.init();
  }

  void enterYoutubeUrl(String youtubeUrl) {
    state = YoutubeUrlSelected(youtubeUrl: youtubeUrl);
  }
}
