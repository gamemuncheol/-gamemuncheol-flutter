import 'dart:typed_data';

class VideoModel {
  final String videoUrl;
  final Uint8List? byteThumbImage;

  VideoModel({required this.videoUrl, this.byteThumbImage});
}
