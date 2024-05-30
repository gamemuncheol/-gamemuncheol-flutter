import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/component/app_dialog.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/create_feed_screen_shared_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/enter_youtube_url_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/feed_form_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/manage_permission_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/video_upload_screen.dart';

mixin VideoUploadScreenState
    on BaseScreenV2State<VideoUploadScreen>, CreateFeedScreenSharedEvent {
  // 갤러리 or 유튜브 url 선택 버튼 토글용 변수
  final ValueNotifier<bool> fromGallery = ValueNotifier(true);

  // 다일얼로그
  // ui는 화면에서 그려줄 거임
  AppDialog Function(String erMessage, VoidCallback onSignleButtonTap)
      get dialog;

  void onLeadingTap() {
    context.pop();
  }

  void onNextButtonTap() {
    fromGallery.value ? _uploadVideo() : _enterYoutubeUrl();
  }

  void useGallery() {
    fromGallery.value = true;
  }

  void useYoutubeUrl() {
    fromGallery.value = false;
  }

  void listenError() {
    ref.listen(
      videoUploadNotifierProvider,
      (previous, next) {
        final ErrorState? errorState = next.isError ? next as ErrorState : null;

        if (errorState?.error == FeedError.VIDEO_NOT_SELECTED ||
            errorState?.error == FeedError.BYTE_OVER_FLOW ||
            errorState?.error == FeedError.UNSUPPORTED_FILE) {
          show(
            content: dialog(next.erMessage, context.pop),
          );
        }
      },
    );
  }

  void _enterYoutubeUrl() {
    ref.read(videoUploadNotifierProvider.notifier).clearCache();
    context.push(EnterYoutubeUrlScreen.PATH);
  }

// 권한 확인 후 동영상 선택 or 권한 관리 화면으로 이동
  Future<void> _uploadVideo() async {
    await checkPermission().then((extraData) async {
      final bool selectable = extraData == null;

      if (selectable) {
        await ref
            .read(videoUploadNotifierProvider.notifier)
            .uploadVideo()
            .then((value) {
          if (value) {
            context.push(FeedFormScreen.PATH);
          }
        });
      } else {
        context.push(ManagePermissionScreen.PATH, extra: extraData);
      }
    });
  }

  @override
  void dispose() {
    fromGallery.dispose();
    super.dispose();
  }
}
