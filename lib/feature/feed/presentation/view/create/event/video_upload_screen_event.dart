import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/common/model/base_error.dart';
import 'package:gamemuncheol/common/presentation/widget/app_dialog.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/service/dialog_service.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/enter_feed_form_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/enter_youtube_url_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/manage_permission_screen.dart';

mixin VideoUploadScreenEvent {
  void onLeadingTap() {
    locator.navKey.context.pop();
  }

  void listenError(
    WidgetRef ref, {
    required DialogService dialogService,
  }) {
    ref.listen(videoUploadNotifierProvider, (previous, next) {
      if (next.isError && (next is VideoNotSelected || next is UnKnown)) {
        const String title = "업로드 실패";

        dialogService.show(
          content: AppDialog.singleButton(
            title: title,
            description: next.erMessage,
            onSignleButtonTap: () => locator.navKey.context.pop(),
          ),
        );
      }
    });
  }

  void enterYoutubeUrl(WidgetRef ref) {
    ref.read(videoUploadNotifierProvider.notifier).clearCache();
    locator.navKey.context.push(EnterYoutubeUrlScreen.PATH);
  }

  Future<void> selectVideo(
    WidgetRef ref, {
    required Future<ExtraData?> Function() checkPermission,
  }) async {
    await checkPermission().then((extraData) async {
      final bool selectable = extraData == null;

      if (selectable) {
        await ref
            .read(videoUploadNotifierProvider.notifier)
            .selectVideo()
            .then((value) {
          if (value) {
            locator.navKey.context.push(EnterFeedFormScreen.PATH);
          }
        });
      } else {
        locator.navKey.context.push(
          ManagePermissionScreen.PATH,
          extra: extraData,
        );
      }
    });
  }
}
