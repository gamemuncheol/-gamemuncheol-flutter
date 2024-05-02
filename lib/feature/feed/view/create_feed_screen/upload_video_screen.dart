// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/bottom_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/step_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/video_upload_buttons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/layout/blur_layout.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/feature/feed/provider/upload_video_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/upload_video_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/upload_video_screen_event.dart';

class UploadVideoScreen extends HookConsumerWidget with UploadVideoScreenEvent {
  const UploadVideoScreen({
    super.key,
  });

  static const PATH = "/upload_video_screen";
  static const ROUTE_NAME = "UploadVideoScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    listenError(context, ref);

    final ValueNotifier<bool> fromGallery = useState(true);

    return BlurLayout<Loading>(
      provider: uploadVideoNotiferProvider,
      child: UploadVideoScreenScaffold(
        stepBar: buildStepBar(onLeadingTap: () => onLeadingTap(context)),
        bottomButton: buildBottomButton(
          onTap: () => fromGallery.value
              ? selectVideo(context, ref)
              : enterYoutubeUrl(context),
        ),
        header: buildHeader(),
        videoUploadButtons: buildVideoUploadButton(fromGallery: fromGallery),
      ),
    );
  }

  Widget buildStepBar({required VoidCallback onLeadingTap}) {
    return FeedStepBar.step3(onLeadingTap: onLeadingTap);
  }

  Widget buildBottomButton({required VoidCallback onTap}) {
    return FeedBottomButton(onTap: onTap);
  }

  Widget buildHeader() {
    return const CreateFeedScreenHeader(title: "플레이한 영상을 업로드\n해 주세요.");
  }

  Widget buildVideoUploadButton({required ValueNotifier<bool> fromGallery}) {
    return VideoUploadButtons(fromGallery: fromGallery);
  }
}
