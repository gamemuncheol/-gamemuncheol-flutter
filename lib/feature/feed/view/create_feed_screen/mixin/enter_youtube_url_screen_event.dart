import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:gamemuncheol/feature/feed/provider/upload_video_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/youtube_url_preview_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

mixin EnterYoutubeUrlScreenEvent {
  void onLeadingTap(BuildContext context, WidgetRef ref) {
    ref.read(uploadVideoNotiferProvider.notifier).clearCache();
    context.pop();
  }

  void enterYoutubeUrl(WidgetRef ref, {required String youtubeUrl}) {
    ref.read(uploadVideoNotiferProvider.notifier).enterYoutubeUrl(youtubeUrl);
  }

  void disablePreview({required ValueNotifier<bool> canPreView}) {
    canPreView.value = false;
  }

  void ablePreview({required ValueNotifier<bool> canPreView}) {
    canPreView.value = true;
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NoSuchYoutubeUrl().message;
    }

    final RegExp pattern = RegExp(
        r'^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube(-nocookie)?\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$');
    final bool match = pattern.hasMatch(value);

    if (!match) {
      return NoSuchYoutubeUrl().message;
    }

    return null;
  }

  void watchPreview(BuildContext context, WidgetRef ref) {
    final String videoId = YoutubePlayer.convertUrlToId(
        ref.read(uploadVideoNotiferProvider).pState.youtubeUrl)!;

    final YoutubePlayerController playerController =
        YoutubePlayerController(initialVideoId: videoId);

    final ExtraData extraData =
        ExtraData({"playerController": playerController});

    context.push(YoutubeUrlPreviewScreen.PATH, extra: extraData);
  }
}
