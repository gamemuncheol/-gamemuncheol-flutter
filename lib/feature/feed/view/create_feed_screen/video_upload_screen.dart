// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/common/service/dialog_service.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/event/permission_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_bottom_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/step_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/upload_button.dart';
import 'package:gamemuncheol/common/presentation/layout/blur_layout.dart';
import 'package:gamemuncheol/feature/feed/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/video_upload_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/event/video_upload_screen_event.dart';

class VideoUploadScreen extends HookConsumerWidget
    with VideoUploadScreenEvent, DialogService, CreateFeedScreenSharedEvent {
  const VideoUploadScreen({super.key});

  static const PATH = "/video_upload_screen";
  static const ROUTE_NAME = "VideoUploadScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    listenError(context, ref, dialogService: this);
    final ValueNotifier<bool> fromGallery = useState(true);

    return BlurLayout<LoadingState>(
      provider: videoUploadNotifierProvider,
      screen: UploadVideoScreenScaffold(
        stepBar: buildStepBar(onLeadingTap: () => onLeadingTap(context)),
        bottomButton: buildBottomButton(
          onTap: () async {
            fromGallery.value
                ? selectVideo(ref, checkPermission: checkPermission)
                : enterYoutubeUrl(context);
          },
        ),
        header: buildHeader(),
        galleryUploadButton: buildGalleryUploadButton(
          selected: fromGallery.value,
          onTap: () => useGallery(fromGallery: fromGallery),
        ),
        youtubeURLUploadButton: buildYoutubeURLUploadButton(
          selected: !fromGallery.value,
          onTap: () => useYoutubeUrl(fromGallery: fromGallery),
        ),
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
    return const FeedScreenHeader(title: "플레이한 영상을 업로드\n해 주세요.");
  }

  Widget buildGalleryUploadButton({
    required bool selected,
    required VoidCallback onTap,
  }) {
    return UploadButton.videoUploadButton(selected: selected, onTap: onTap);
  }

  Widget buildYoutubeURLUploadButton({
    required bool selected,
    required VoidCallback onTap,
  }) {
    return UploadButton.youtubeUrlUploadButton(selected: selected, onTap: onTap);
  }
}
