import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/enter_feed_form_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/youtube_url_preview_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:go_router/go_router.dart';

mixin EnterYoutubeUrlScreenEvent {
  void onLeadingTap(WidgetRef ref) {
    ref.read(videoUploadNotifierProvider.notifier).clearCache();
    locator.navKey.context.pop();
  }

  void onNextButtonTap() {
    locator.navKey.context.pushReplacement(EnterFeedFormScreen.PATH);
  }

  Future<void> enterYoutubeUrl(
    WidgetRef ref, {
    required String youtubeUrl,
  }) async {
    await ref
        .read(videoUploadNotifierProvider.notifier)
        .enterYoutubeUrl(youtubeUrl, validator: _validator);
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return NoSuchYoutubeUrl().message;
    }

    final RegExp pattern = RegExp(
        r'^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube(-nocookie)?\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$');
    bool match = pattern.hasMatch(value);

    if (!match) {
      return NoSuchYoutubeUrl().message;
    }

    return null;
  }

  void onPreviewButtonTap({required String youtubeUrl}) {
    final String videoId = YoutubePlayer.convertUrlToId(youtubeUrl)!;

    final YoutubePlayerController playerController =
        YoutubePlayerController(initialVideoId: videoId);

    final ExtraData extraData =
        ExtraData({"playerController": playerController});

    locator.navKey.context.push(YoutubeUrlPreviewScreen.PATH, extra: extraData);
  }
}
