import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/service/dialog_service.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/change_thumb_image_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/event/change_thumb_image_screen_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_bottom_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/step_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/thumb_image.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/upload_button.dart';

class ChangeThumbImageScreen extends HookConsumerWidget
    with ChangeThumbImageScreenEvent, DialogService {
  final bool hasGalleryPermission;
  const ChangeThumbImageScreen({super.key, required this.hasGalleryPermission});

  static const PATH = "/change_thumb_image_screen";
  static const ROUTE_NAME = "ChangeThumbImageScreen";

  factory ChangeThumbImageScreen.fromExtra(ExtraData? extraData) {
    return ChangeThumbImageScreen(
      hasGalleryPermission: extraData?.data["hasGalleryPermission"] ?? true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> selected = useState(hasGalleryPermission);

    listenError(ref, dialogService: this);

    return ChangeThumbImageScreenScaffold(
      stepBar: buildStepBar(onTap: () => onLeadingTap()),
      bottomButton: buildBottomButton(onTap: () => onBottomButtonTap()),
      thumbImage:
          buildThumbImage(onPreviewButtonTap: () => pushPreviewScreen(ref)),
      thumbImageChangeButton: buildThumbImageChangeButton(
        selected: selected.value,
        onTap: () => changeThumbnail(ref),
      ),
    );
  }

  Widget buildStepBar({required VoidCallback onTap}) {
    return FeedStepBar.fullArgument(
      onLeadingTap: onTap,
      action: SizedBoxBuilder().setWidth(16).build(),
      title: "썸네일 변경",
    );
  }

  Widget buildBottomButton({required VoidCallback onTap}) {
    return FeedBottomButton(onTap: onTap);
  }

  Widget buildThumbImage({
    required VoidCallback onPreviewButtonTap,
  }) {
    return ThumbImage(onPreviewButtonTap: onPreviewButtonTap);
  }

  Widget buildThumbImageChangeButton({
    required bool selected,
    required VoidCallback onTap,
  }) {
    return UploadButton.videoUploadButton(selected: selected, onTap: onTap);
  }
}
