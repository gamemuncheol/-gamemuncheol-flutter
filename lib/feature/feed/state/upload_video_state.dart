import 'dart:io';

import 'package:gamemuncheol/common/model/base_state.dart';

mixin VideoUploadState on BaseState<VideoUploadState> {
  @override
  get pState => this;

  bool get isVideoFileSelect => this is VideoFileSelected;
  bool get isYoutubeUrlSelect => this is YoutubeUrlSelected;

  File get videoFile => (this as VideoFileSelected).videoFile;
  String get youtubeUrl => (this as YoutubeUrlSelected).youtubeUrl;

  R whenPState<R>({
    R Function(File videoFile)? videoFileSelect,
    R Function(String youtubeUrl)? youtubeUrlSelected,
    R Function()? orElse,
  }) {
    if (isVideoFileSelect && videoFileSelect != null) {
      return videoFileSelect(videoFile);
    } else if (isYoutubeUrlSelect && youtubeUrlSelected != null) {
      return youtubeUrlSelected(youtubeUrl);
    } else {
      return orElse!();
    }
  }
}

class VideoFileSelected extends BaseState<VideoUploadState>
    with VideoUploadState {
  @override
  final File videoFile;

  VideoFileSelected({required this.videoFile});
}

class YoutubeUrlSelected extends BaseState<VideoUploadState>
    with VideoUploadState {
  @override
  final String youtubeUrl;

  YoutubeUrlSelected({required this.youtubeUrl});
}
