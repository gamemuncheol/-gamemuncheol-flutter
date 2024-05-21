import 'dart:io';

import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/model/common_response.dart';

part 'create_feed_provider.g.dart';

@riverpod
class CreateFeedNotifier extends _$CreateFeedNotifier {
  @override
  StateMapper<SingleDataState<CommonResponse>> build() => StateMapper.init();

  Future<void> uploadVideo() async {}
  Future<void> uploadThumbImage(File thumbImageFile) async {
    final Result<String> thumbImageUrl =
        await ref.read(feedRepositoryProvider).uploadThumbImage(thumbImageFile);

    thumbImageUrl.when(
      success: (thumbImageUrl) {
        print(thumbImageUrl);
        state = StateMapper.init();
      },
      failure: (error) {

      },
    );
  }

  Future<void> uploadFeed() async {}
}
