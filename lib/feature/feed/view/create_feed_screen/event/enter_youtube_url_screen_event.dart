import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/feature/feed/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_feed_form_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/youtube_url_preview_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:go_router/go_router.dart';

mixin EnterYoutubeUrlScreenEvent {
  void onLeadingTap(BuildContext context, WidgetRef ref) {
    ref.read(videoUploadNotifierProvider.notifier).clearCache();
    context.pop();
  }

  void onBottomButtonTap(BuildContext context) {
    context.push(EnterFeedFormScreen.PATH);
  }

  Future<void> enterYoutubeUrl(
    WidgetRef ref, {
    required String youtubeUrl,
  }) async {
    await ref
        .read(videoUploadNotifierProvider.notifier)
        .enterYoutubeUrl(youtubeUrl, validator: validator);
  }

  String? validator(String? value) {
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

  void onPreviewButtonTap(BuildContext context, {required String youtubeUrl}) {
    final String videoId = YoutubePlayer.convertUrlToId(youtubeUrl)!;

    final YoutubePlayerController playerController =
        YoutubePlayerController(initialVideoId: videoId);

    final ExtraData extraData =
        ExtraData({"playerController": playerController});

    context.push(YoutubeUrlPreviewScreen.PATH, extra: extraData);
  }
}
