import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/feed_form_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/enter_youtube_url_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/youtube_url_preview_screen.dart';

mixin EnterYoutubeUrlScreenState
    on BaseScreenV2State<EnterYoutubeUrlScreen> {
  void onLeadingTap() {
    ref.read(videoUploadNotifierProvider.notifier).clearCache();
    context.pop();
  }

  void onNextButtonTap() {
    context.pushReplacement(FeedFormScreen.PATH);
  }

  Future<void> enterYoutubeUrl(String youtubeUrl) async {
    await ref
        .read(videoUploadNotifierProvider.notifier)
        .enterYoutubeUrl(youtubeUrl);
  }

  void onPreviewButtonTap({required String youtubeUrl}) {
    final playerController = YoutubePlayerController(
        initialVideoId:
            ref.read(videoUploadNotifierProvider).pState.videoModel.videoUrl);

    context.push(YoutubeUrlPreviewScreen.PATH,
        extra: ExtraData({"playerController": playerController}));
  }
}
