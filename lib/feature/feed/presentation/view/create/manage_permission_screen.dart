// ignore_for_file: constant_identifier_names

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/manage_permission_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/manage_permission_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_header.dart';

class ManagePermissionScreen extends BaseScreen
    with ManagePermissionScreenEvent {
  final bool hasGalleryPermission;
  final bool hasCameraPermission;

  ManagePermissionScreen({
    super.key,
    required this.hasGalleryPermission,
    required this.hasCameraPermission,
  });

  static const PATH = "/manage_permission_permission_screen";
  static const NAME = "ManagePermissionScreen";

  factory ManagePermissionScreen.fromExtraData(ExtraData extraData) {
    return ManagePermissionScreen(
        hasGalleryPermission: extraData.data["hasGalleryPermission"],
        hasCameraPermission: extraData.data["hasCameraPermission"]);
  }

  @override
  PreferredSizeWidget? buildAppBar(ref) {
    final double actionPadding = 16.w;

    useEffect(() {
      return () => EasyDebounce.cancelAll();
    }, []);

    return AppBar(
      elevation: 0,
      backgroundColor: colorTheme.background,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: actionPadding),
          child: Center(
            child: GestureDetector(
              onTap: onCloseActionIconTap,
              child: SvgPicture.asset(
                AppAsset.closeBlack,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> hasGalleryPermission =
        useState(this.hasGalleryPermission);

    final ValueNotifier<bool> hasCameraPermission =
        useState(this.hasCameraPermission);

    return ManagePermissionScreenLayout(
      header: buildHeader(),
      galleryPermissionButton: buildGalleryPermissionButton(
        hasPermission: hasGalleryPermission.value,
        onTap: () => requestGalleryPermission(
          onDeniedCallback: () {
            showSnackBar(content: buildSnackBarContent());
          },
          onGrantedCallback: () {
            hasGalleryPermission.value = true;
          },
        ),
      ),
      cameraPermissionButton: buildCameraPermissionButton(
        hasPermission: hasCameraPermission.value,
        onTap: () => requestCameraPermission(
          onDeniedCallback: () {
            showSnackBar(content: buildSnackBarContent());
          },
          onGrantedCallback: () {
            hasCameraPermission.value = true;
          },
        ),
      ),
    );
  }

  Widget buildHeader() {
    const String title = "카메라와 앨범에 접근 할\n수 있도록 허용해 주세요.";
    return const CreateFeedScreenHeader(
      title: title,
    );
  }

  Widget buildGalleryPermissionButton({
    required VoidCallback onTap,
    required bool hasPermission,
  }) {
    const String label = "앨범 읽기, 쓰기 허용";

    return buildButton(
      isSelected: hasPermission,
      onTap: onTap,
      label: label,
    );
  }

  Widget buildCameraPermissionButton({
    required VoidCallback onTap,
    required bool hasPermission,
  }) {
    const String label = "카메라 엑세스 허용";

    return buildButton(
      isSelected: hasPermission,
      onTap: onTap,
      label: label,
    );
  }

  Widget buildButton({
    required VoidCallback onTap,
    required bool isSelected,
    required String label,
  }) {
    final buttonDeco = BoxDecoration(
      color: colorTheme.primaryWhite,
      borderRadius: BorderRadius.circular(64),
      border: Border.all(
        color: isSelected ? colorTheme.primaryBlue : colorTheme.natural04,
      ),
    );

    final labelStyle = textStyleTheme.body3M.copyWith(
        color: isSelected ? colorTheme.primaryBlue : colorTheme.natural04);

    final double buttonWidth = 357.w;
    final double buttonHeight = 64.h;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: buttonDeco,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAsset.galleryOn,
              ),
              Text(
                label,
                style: labelStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSnackBarContent() {
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
