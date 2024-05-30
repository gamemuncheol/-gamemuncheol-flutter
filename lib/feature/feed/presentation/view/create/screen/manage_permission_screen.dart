// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/common/presentation/component/permission_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/manage_permission_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/manage_permission_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_header.dart';

class ManagePermissionScreen extends BaseScreenV2 {
  final bool hasGalleryPermission;
  final bool hasCameraPermission;

  const ManagePermissionScreen({
    super.key,
    required this.hasGalleryPermission,
    required this.hasCameraPermission,
  });

  static const PATH = "/$NAME";
  static const NAME = "MANAGE_PERMISSION_SCREEN";

  factory ManagePermissionScreen.fromExtraData(ExtraData extraData) {
    return ManagePermissionScreen(
        hasGalleryPermission: extraData.data["hasGalleryPermission"],
        hasCameraPermission: extraData.data["hasCameraPermission"]);
  }

  @override
  BaseScreenV2State<ManagePermissionScreen> createState() =>
      _ManagePermissionScreenV2State();
}

class _ManagePermissionScreenV2State
    extends BaseScreenV2State<ManagePermissionScreen>
    with DefaultLayout, ManagePermissionScreenState {
  @override
  Widget get snackBarContent {
    {
      const title = "설정 -> 직접 권한을 허용해 주세요.";
      final titleStyle =
          textStyleTheme.body4R.copyWith(color: colorTheme.onPrimaryBlue);

      return Center(
        child: Text(
          title,
          style: titleStyle,
        ),
      );
    }
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    final double actionPadding = 16.w;

    return AppBar(
      elevation: 0,
      backgroundColor: colorTheme.background,
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: actionPadding,
          ),
          child: Center(
            child: GestureDetector(
              onTap: onLeadingTap,
              child: SvgPicture.asset(
                AppAsset.THUMB_IMAGE_BASIC,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget buildBody() {
    return ManagePermissionScreenLayout(
      header: _buildHeader(),
      galleryPermissionButton: _buildGalleryPermissionButton(),
      cameraPermissionButton: _buildCameraPermissionButton(),
    );
  }

  Widget _buildHeader() {
    const String title = "카메라와 앨범에 접근 할\n수 있도록 허용해 주세요.";
    return const CreateFeedScreenHeader(
      title: title,
    );
  }

  Widget _buildGalleryPermissionButton() {
    const String label = "앨범 읽기, 쓰기 허용";

    return ValueListenableBuilder(
      valueListenable: hasGalleryPermission,
      builder: (context, value, child) {
        return PermissionButton(
            onTap: requestGalleryPermission,
            hasPermission: hasGalleryPermission.value,
            label: label,
            iconPath: AppAsset.GALLER_ON);
      },
    );
  }

  Widget _buildCameraPermissionButton() {
    const String label = "카메라 엑세스 허용";

    return ValueListenableBuilder(
      valueListenable: hasCameraPermission,
      builder: (context, value, child) {
        return PermissionButton(
            onTap: requestCameraPermission,
            hasPermission: hasCameraPermission.value,
            label: label,
            iconPath: AppAsset.GALLER_ON);
      },
    );
  }
}
