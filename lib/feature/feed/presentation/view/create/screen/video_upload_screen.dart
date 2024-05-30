// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/common/presentation/component/app_dialog.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/create_feed_screen_shared_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/video_upload_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/video_upload_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_app_bar.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_header.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/video_upload_button.dart';

class VideoUploadScreen extends BaseScreenV2 {
  const VideoUploadScreen({super.key});

  static const PATH = "/$NAME";
  static const NAME = "VIDEO_UPLOAD_SCREEN";

  @override
  BaseScreenV2State<VideoUploadScreen> createState() =>
      _VideoUploadScreenV2State();
}

class _VideoUploadScreenV2State extends BaseScreenV2State<VideoUploadScreen>
    with BlurLayout, CreateFeedScreenSharedEvent, VideoUploadScreenState {
  @override
  AppDialog Function(String erMessage, VoidCallback onSignleButtonTap)
      get dialog => (String erMessage, VoidCallback onSignleButtonTap) {
            return AppDialog.singleButton(
                title: "업로드 실패",
                description: erMessage,
                onSignleButtonTap: onSignleButtonTap);
          };

  @override
  ProviderListenable get provider => videoUploadNotifierProvider;

  @override
  PreferredSize? buildAppBar() {
    return CreateFeedScreenAppBar.step3(
      onLeadingTap: onLeadingTap,
    ).toAppBar();
  }

  @override
  Widget buildBody() {
    listenError();

    return ValueListenableBuilder(
      valueListenable: fromGallery,
      builder: (context, value, child) {
        return UploadVideoScreenLayout(
          bottomButton: _buildNextButton(),
          header: _buildHeader(),
          galleryUploadButton: _buildGalleryUploadButton(),
          youtubeURLUploadButton: _buildYoutubeURLUploadButton(),
        );
      },
    );
  }

  Widget _buildNextButton() {
    return CreateFeedScreenNextButton(
      onTap: onNextButtonTap,
    );
  }

  Widget _buildHeader() {
    const String title = "플레이한 영상을 업로드\n해 주세요.";
    return const CreateFeedScreenHeader(title: title);
  }

  Widget _buildGalleryUploadButton() {
    return UploadButton.videoUploadButton(
        onTap: useGallery, selected: fromGallery.value);
  }

  Widget _buildYoutubeURLUploadButton() {
    return UploadButton.youtubeUrlUploadButton(
        onTap: useYoutubeUrl, selected: !fromGallery.value);
  }
}
