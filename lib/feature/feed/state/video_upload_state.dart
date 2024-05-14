import 'dart:io';
import 'dart:typed_data';

import 'package:gamemuncheol/common/model/base_state.dart';

mixin VideoUploadState on StateMapper<VideoUploadState> {
  @override
  get pState => this;

  bool get isVideoFileSelect => this is VideoFileSelected;
  bool get isYoutubeUrlSelect => this is YoutubeUrlSelected;

  File get videoFile;
  String get youtubeUrl;
  Uint8List? get byteThumbImage;

  R whenPState<R>({
    R Function(File videoFile, Uint8List? byteThumbImage)? videoFileSelected,
    R Function(String youtubeUrl, Uint8List byteThumbImage)? youtubeUrlSelected,
    R Function()? orElse,
  }) {
    if (isVideoFileSelect && videoFileSelected != null) {
      return videoFileSelected(videoFile, byteThumbImage);
    } else if (isYoutubeUrlSelect && youtubeUrlSelected != null) {
      return youtubeUrlSelected(youtubeUrl, byteThumbImage!);
    } else {
      return orElse!();
    }
  }
}

class VideoFileSelected extends StateMapper<VideoUploadState>
    with VideoUploadState {
  @override
  final Uint8List? byteThumbImage;

  @override
  final File videoFile;

  @override
  String get youtubeUrl => throw UnimplementedError();

  VideoFileSelected({this.byteThumbImage, required this.videoFile});
}

class YoutubeUrlSelected extends StateMapper<VideoUploadState>
    with VideoUploadState {
  @override
  final Uint8List byteThumbImage;

  @override
  final String youtubeUrl;

  @override
  File get videoFile => throw UnimplementedError();

  YoutubeUrlSelected({required this.byteThumbImage, required this.youtubeUrl});
}
