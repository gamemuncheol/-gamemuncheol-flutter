import 'dart:typed_data';

import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_repository.dart';

part 'change_thumbnail_provider.g.dart';

@riverpod
class ChangeThumbNailNotifier extends _$ChangeThumbNailNotifier {
  @override
  StateMapper<SingleDataState<Uint8List>> build() => StateMapper.init();

  Future<void> init(Uint8List? byteThumbImage) async {
    state = LoadingState();
    if (byteThumbImage == null) {
      state = ErrorState(ThumbImageInitializeFailed());
      return;
    }

    state = SingleDataState(data: byteThumbImage);
    return;
  }

  Future<void> changeThumbnail() async {
    final FeedRepository feedRepository = ref.read(feedRepositoryProvider);

    state = state.withCache(LoadingState());
    final Result<Uint8List> uint8List = await feedRepository.changeThumbNail();

    uint8List.when(
      success: (uint8List) {
        state = state.withCache(SingleDataState(data: uint8List));
      },
      failure: (error) {
        state = state.withCache(ErrorState(error));
      },
    );
  }
}
