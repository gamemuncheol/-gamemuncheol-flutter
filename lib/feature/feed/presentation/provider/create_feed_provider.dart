import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/model/feed.dart';
import 'package:gamemuncheol/feature/feed/service/feed_service.dart';

part 'create_feed_provider.g.dart';

@riverpod
class CreateFeedNotifier extends _$CreateFeedNotifier {
  @override
  StateMapper<SingleDataState<Feed>> build() => StateMapper.init();

  Future<bool> post({
    required String videoUrl,
    required Uint8List thumbImageFile,
    required String title,
    required String content,
    required List<int> matchUserIds,
    required List<String> tags,
  }) async {
    state = LoadingState(
      message: "피드 업로드 중..",
    );

    final feed = await ref.read(feedServiceProvider).post(
        videoUrl: videoUrl,
        thumbImageFile: thumbImageFile,
        title: title,
        content: content,
        matchUserIds: matchUserIds,
        tags: tags);

    return feed.when(
      success: (feed) {
        state = SingleDataState(data: feed);
        return true;
      },
      failure: (error) {
        state = ErrorState(error);
        return false;
      },
    );
  }
}
