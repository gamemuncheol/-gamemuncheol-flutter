import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/model/video_model.dart';

mixin VideoUploadState on StateMapper<VideoUploadState> {
  @override
  get pState => this;

  bool get isVideoFileSelect => this is VideoFileSelected;
  bool get isYoutubeUrlSelect => this is YoutubeUrlSelected;

  VideoModel get videoModel;

  R whenPState<R>({
    R Function(VideoModel videoModel)? videoFileSelected,
    R Function(VideoModel videoModel)? youtubeUrlSelected,
    R Function()? orElse,
  }) {
    if (isVideoFileSelect && videoFileSelected != null) {
      return videoFileSelected(videoModel);
    } else if (isYoutubeUrlSelect && youtubeUrlSelected != null) {
      return youtubeUrlSelected(videoModel);
    } else {
      return orElse!();
    }
  }
}

class VideoFileSelected extends StateMapper<VideoUploadState>
    with VideoUploadState {
  @override
  final VideoModel videoModel;

  VideoFileSelected({
    required this.videoModel,
  });
}

class YoutubeUrlSelected extends StateMapper<VideoUploadState>
    with VideoUploadState {
  @override
  final VideoModel videoModel;

  YoutubeUrlSelected({
    required this.videoModel,
  });
}
