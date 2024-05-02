import 'dart:io';
import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_repository.dart';

part 'change_thumbnail_provider.g.dart';

@riverpod
class ChangeThumbNailNotifier extends _$ChangeThumbNailNotifier {
  @override
  BaseState<Uint8List> build() => BaseState.init();

  Future<void> init({required File videoFile}) async {
    final FeedRepository feedRepository = ref.read(feedRepositoryProvider);
    state = BaseState.withCache(Loading(), preState: state);
    
    final Result<Uint8List> uint8List =
        await feedRepository.extractThumbNail(videoFile: videoFile);

    uint8List.when(
      success: (uint8List) {
        state = BaseState.withCache(Data(uint8List), preState: state);
      },
      failure: (error) => state = BaseState.withCache(Error(error), preState: state),
    );
  }

  Future<void> changeThumbnail() async {
    final FeedRepository feedRepository = ref.read(feedRepositoryProvider);

    state = BaseState.withCache(Loading(), preState: state);
    final Result<Uint8List> uint8List = await feedRepository.changeThumbNail();

    uint8List.when(
      success: (uint8List) {
        state = BaseState.withCache(Data(uint8List), preState: state);
      },
      failure: (error) => state = BaseState.withCache(Error(error), preState: state),
    );
  }
}
