import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/presentation/component/app_dialog.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/change_thumb_image_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/create_feed_screen_shared_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/manage_permission_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/change_thumb_image_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/video_file_preview_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/youtube_url_preview_screen.dart';

mixin ChangeThumbImageScreenState
    on BaseScreenV2State<ChangeThumbImageScreen>, CreateFeedScreenSharedEvent {
  // 갤러리 권한 확인용 bool 변수
  late final ValueNotifier<bool> hasPermission =
      ValueNotifier(widget.hasGalleryPermission);

  // 다일얼로그
  // ui는 화면에서 그려줄 거임
  AppDialog Function(String erMessage, VoidCallback onSignleButtonTap)
      get dialog;

  // 리딩 이벤트
  // 변경 완료 버튼이 아닌 리딩으로 뒤로가기 시 이전 썸네일을 유지
  void onLeadingTap() {
    final originOne =
        ref.read(videoUploadNotifierProvider).pState.videoModel.byteThumbImage;

    ref
        .read(changeThumbImageNotifierProvider.notifier)
        .init(originOne)
        .whenComplete(context.pop);
  }

  // 변경 완료 버튼 이벤트
  // 바뀐 썸네일 유지
  void onNextButtonTap() {
    context.pop();
  }

  // 에러 리스너
  // 사진을 선택하지 않았거나, 지원하지 않는 파일일 때 다이얼로그를 띄움
  void listenError() {
    ref.listen(changeThumbImageNotifierProvider, (previous, next) {
      if (next.isError && next.erMessage.isNotEmpty) {
        show(
          content: dialog(next.erMessage, context.pop),
        );
      }
    });
  }

  // 썸네일 변경 메소드
  // 1. 권한 체크 후
  // 2. 권한 있으면 갤러리에 접근, 없으면 권한 관리 화면으로 이동
  Future<void> changeThumbnail() async {
    await checkPermission().then((extraData) async {
      final bool selectable = extraData == null;

      if (selectable) {
        await ref
            .read(changeThumbImageNotifierProvider.notifier)
            .changeThumbImage();
      } else {
        final bool? hasPermission =
            await context.push(ManagePermissionScreen.PATH, extra: extraData);

        this.hasPermission.value = hasPermission ?? false;
      }
    });
  }

  // 미리 보기 메소드
  // 비디오 업로드 상태가 파일이면 파일 미리보기 화면으로,
  // 비디오 업로드 생타가 유튜브 URL이면 유튜브 URL 미리보기 화면으로 이동
  void onPreviewButtonTap() {
    final pState = ref.read(videoUploadNotifierProvider).pState;
    final String videoUrl = pState.videoModel.videoUrl;
    final String screenPath = pState.isVideoFileSelect
        ? VideoFilePreviewScreenV2.PATH
        : YoutubeUrlPreviewScreen.PATH;

    ExtraData? extraData;

    if (pState.isVideoFileSelect) {
      extraData = ExtraData({
        "videoPlayerController":
            VideoPlayerController.networkUrl(Uri.parse(videoUrl)),
      });
    } else {
      extraData = ExtraData({
        "playerController": YoutubePlayerController(initialVideoId: videoUrl)
      });
    }

    context.push(screenPath, extra: extraData);
  }
}
