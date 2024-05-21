// ignore_for_file: constant_identifier_names

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/create_feed_screen_shared_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/change_thumb_image_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/change_thumb_image_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/thumb_image.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/video_upload_button.dart';

class ChangeThumbImageScreen extends BaseScreen
    with ChangeThumbImageScreenEvent, CreateFeedScreenSharedEvent {
  final bool hasGalleryPermission;
  ChangeThumbImageScreen({super.key, required this.hasGalleryPermission});

  static const PATH = "/change_thumb_image_screen";
  static const NAME = "ChangeThumbImageScreen";

  factory ChangeThumbImageScreen.fromExtra(ExtraData? extraData) {
    final Map<String, dynamic>? data = extraData?.data;

    return ChangeThumbImageScreen(
        hasGalleryPermission: data?["hasGalleryPermission"] ?? true);
  }

  @override
  PreferredSizeWidget? buildAppBar(WidgetRef ref) {
    final double leadingWidth = 44.w;
    final double leadingPadding = 16.w;

    const String iconPath = AppAsset.chevronLeftBlack;
    const String title = "썸네일 변경";
    final titleStyle = textStyleTheme.body4R;

    return AppBar(
      elevation: 0,
      backgroundColor: colorTheme.background,
      leadingWidth: leadingWidth,
      leading: GestureDetector(
        onTap: () => onLeadingTap(ref),
        child: Padding(
          padding: EdgeInsets.only(left: leadingPadding),
          child: SvgPicture.asset(iconPath),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: titleStyle,
      ),
    );
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    listenError(ref, dialogService: this);

    final ValueNotifier<bool> hasPermission = useState(hasGalleryPermission);

    return ChangeThumbImageScreenLayout(
      bottomButton: buildNextButton(onTap: onNextButtonTap),
      thumbImage: buildThumbImage(
        onPreviewButtonTap: () => onPreviewButtonTap(ref),
      ),
      thumbImageChangeButton: buildThumbImageChangeButton(
        hasPermission: hasPermission.value,
        onTap: () => changeThumbnail(ref, checkPermission: checkPermission),
      ),
    );
  }

  Widget buildNextButton({required VoidCallback onTap}) {
    const String label = "변경 완료";

    return CreateFeedScreenNextButton(
      onTap: onTap,
      label: label,
    );
  }

  Widget buildThumbImage({
    required VoidCallback onPreviewButtonTap,
  }) {
    return ThumbImage.previewButton(
      ontTap: onPreviewButtonTap,
    );
  }

  Widget buildThumbImageChangeButton({
    required VoidCallback onTap,
    required bool hasPermission,
  }) {
    return UploadButton.videoUploadButton(
      selected: hasPermission,
      onTap: onTap,
    );
  }
}
