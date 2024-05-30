// ignore_for_file: constant_identifier_names, depend_on_referenced_packages, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod/src/framework.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/presentation/component/app_dialog.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/change_thumb_image_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/thumb_image.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/video_upload_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/change_thumb_image_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/create_feed_screen_shared_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/change_thumb_image_screen_layout.dart';

class ChangeThumbImageScreen extends BaseScreenV2 {
  final bool hasGalleryPermission;
  const ChangeThumbImageScreen({super.key, required this.hasGalleryPermission});

  static const PATH = "/$NAME";
  static const NAME = "CHANGE_THUMB_IMAGE_SCREEN";

  factory ChangeThumbImageScreen.fromExtra(ExtraData? extraData) =>
      ChangeThumbImageScreen(
          hasGalleryPermission:
              extraData?.data["hasGalleryPermission"] ?? true);

  @override
  BaseScreenV2State<ChangeThumbImageScreen> createState() =>
      _ChangeThumbImageScreenV2State();
}

class _ChangeThumbImageScreenV2State
    extends BaseScreenV2State<ChangeThumbImageScreen>
    with BlurLayout, CreateFeedScreenSharedEvent, ChangeThumbImageScreenState {
  //
  @override
  ProviderListenable get provider => changeThumbImageNotifierProvider;

  @override
  AppDialog Function(String erMessage, VoidCallback onSignleButtonTap)
      get dialog => (String erMessage, VoidCallback onSignleButtonTap) {
            return AppDialog.singleButton(
                title: "업로드 실패",
                description: erMessage,
                onSignleButtonTap: onSignleButtonTap);
          };

  @override
  PreferredSizeWidget? buildAppBar() {
    final double leadingWidth = 44.w;
    final double leadingPadding = 16.w;

    const String iconPath = AppAsset.CHEVRON_LEFT_BLACK;
    const String title = "썸네일 변경";
    final titleStyle = textStyleTheme.body4R;

    return AppBar(
      elevation: 0,
      backgroundColor: colorTheme.background,
      leadingWidth: leadingWidth,
      leading: GestureDetector(
        onTap: onLeadingTap,
        child: Padding(
          padding: EdgeInsets.only(left: leadingPadding),
          child: SvgPicture.asset(
            iconPath,
          ),
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
  Widget buildBody() {
    listenError();

    return ChangeThumbImageScreenLayout(
      bottomButton: _buildNextButton(),
      thumbImage: _buildThumbImage(),
      thumbImageChangeButton: _buildThumbImageChangeButton(),
    );
  }

  Widget _buildNextButton() {
    const String label = "변경 완료";

    return CreateFeedScreenNextButton(
      onTap: onNextButtonTap,
      label: label,
    );
  }

  Widget _buildThumbImage() {
    return ThumbImage.previewButton(
      ontTap: onPreviewButtonTap,
    );
  }

  Widget _buildThumbImageChangeButton() {
    return ValueListenableBuilder(
      valueListenable: hasPermission,
      builder: (context, value, child) {
        return UploadButton.videoUploadButton(
          onTap: changeThumbnail,
          selected: hasPermission.value,
        );
      },
    );
  }
}
