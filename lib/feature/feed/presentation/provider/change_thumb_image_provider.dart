import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:gamemuncheol/feature/feed/service/feed_service.dart';

part 'change_thumb_image_provider.g.dart';

@riverpod
class ChangeThumbImageNotifier extends _$ChangeThumbImageNotifier {
  @override
  StateMapper<SingleDataState<Uint8List>> build() => StateMapper.init();

  Future<void> init(Uint8List? byteThumbImage) async {
    state = LoadingState();

    if (byteThumbImage == null) {
      state = ErrorState(
        FeedError.THUMB_IMAGE_INITIALIZE_FAILED,
      );
      return;
    }

    state = SingleDataState(
      data: byteThumbImage,
    );
  }

  Future<void> changeThumbImage() async {
    state = state.withCache(
      LoadingState(
        message: "동영상 업로드 중..",
      ),
    );

    final byteThumbImage =
        await ref.read(feedServiceProvider).changeThumbImage();

    byteThumbImage.when(
      success: (byteThumbImage) {
        state = state.withCache(SingleDataState(data: byteThumbImage));
      },
      failure: (e) {
        state = state.withCache(
          ErrorState(e),
        );
      },
    );
  }
}
