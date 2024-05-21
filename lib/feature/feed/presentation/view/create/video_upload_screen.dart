// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/create_feed_screen_shared_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/video_upload_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/video_upload_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_header.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/video_upload_screen_event.dart';

class VideoUploadScreen extends BaseScreen
    with VideoUploadScreenEvent, CreateFeedScreenSharedEvent {
  VideoUploadScreen({super.key});

  static const PATH = "/video_upload_screen";
  static const NAME = "VideoUploadScreen";

  // blurLayout
  @override
  get provider => videoUploadNotifierProvider;

  @override
  PreferredSize? buildAppBar(ref) {
    return CreateFeedScreenAppBar.step3(onLeadingTap: onLeadingTap).toAppBar();
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    listenError(ref, dialogService: this);

    final ValueNotifier<bool> fromGallery = useState(true);

    return UploadVideoScreenLayout(
      bottomButton: buildNextButton(
        onTap: () async {
          fromGallery.value
              ? selectVideo(ref, checkPermission: checkPermission)
              : enterYoutubeUrl(ref);
        },
      ),
      header: buildHeader(),
      galleryUploadButton: buildGalleryUploadButton(
        onTap: () {
          fromGallery.value = true;
        },
        selected: fromGallery.value,
      ),
      youtubeURLUploadButton: buildYoutubeURLUploadButton(
        onTap: () {
          fromGallery.value = false;
        },
        selected: !fromGallery.value,
      ),
    );
  }

  Widget buildNextButton({required VoidCallback onTap}) {
    return CreateFeedScreenNextButton(onTap: onTap);
  }

  Widget buildHeader() {
    const String title = "플레이한 영상을 업로드\n해 주세요.";
    return const CreateFeedScreenHeader(title: title);
  }

  Widget buildGalleryUploadButton({
    required VoidCallback onTap,
    required bool selected,
  }) {
    return UploadButton.videoUploadButton(selected: selected, onTap: onTap);
  }

  Widget buildYoutubeURLUploadButton({
    required VoidCallback onTap,
    required bool selected,
  }) {
    return UploadButton.youtubeUrlUploadButton(
        selected: selected, onTap: onTap);
  }
}
