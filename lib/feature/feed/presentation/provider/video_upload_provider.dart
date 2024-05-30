import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/feature/feed/model/video_model.dart';
import 'package:gamemuncheol/feature/feed/presentation/state/video_upload_state.dart';
import 'package:gamemuncheol/feature/feed/service/feed_service.dart';

part 'video_upload_provider.g.dart';

@riverpod
class VideoUploadNotifier extends _$VideoUploadNotifier {
  @override
  StateMapper<VideoUploadState> build() => StateMapper.init();

  void clearCache() {
    state = StateMapper.init();
  }

  Future<bool> uploadVideo() async {
    state = LoadingState(
      message: "동영상 업로드 중..",
    );

    final feedService = ref.read(feedServiceProvider);

    final Result<VideoModel> videoModel = await feedService.uploadVideo();

    return videoModel.when(
      success: (videoModel) async {
        state = VideoFileSelected(videoModel: videoModel);
        return true;
      },
      failure: (error) {
        state = ErrorState(error);
        return false;
      },
    );
  }

  Future<void> enterYoutubeUrl(String youtubeUrl) async {
    state = LoadingState();
    final feedService = ref.read(feedServiceProvider);

    final videoModel = await feedService.enterYoutubeUrl(youtubeUrl);

    videoModel.when(
      success: (videoModel) async {
        state = YoutubeUrlSelected(videoModel: videoModel);
        return true;
      },
      failure: (error) {
        state = ErrorState(error);
        return false;
      },
    );
  }
}
