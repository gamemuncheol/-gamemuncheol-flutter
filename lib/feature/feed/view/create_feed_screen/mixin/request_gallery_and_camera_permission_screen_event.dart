import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/permission/permission_handler.dart';
import 'package:gamemuncheol/common/util/snack_bar_util.dart';
import 'package:permission_handler/permission_handler.dart';

mixin RequestGalleryAndCameraPermissionEvent {
  void whenGalleryPermissionGranted({
    required ValueNotifier<bool> hasGalleryPermisson,
  }) {
    hasGalleryPermisson.value = true;
  }

  void whenCameraPermissionGranted({
    required ValueNotifier<bool> hasCameraPermisstion,
  }) {
    hasCameraPermisstion.value = true;
  }

  void showSnackBark(BuildContext context) {
    SnackBarUtils.snackBar(
      context,
      text: "권한을 허용해 주세요.",
    );
  }

  void requestGalleryPermission(
    BuildContext context, {
    required VoidCallback whenGalleryPermissionGranted,
  }) async {
    if (!Platform.isAndroid) {
      // 안드로이드는 권한이 필요 없음
      await PermissionHandlerHelper.request(
        Permission.photos,
        onDeniedCallback: () => showSnackBark(context),
        onGrantedCallback: whenGalleryPermissionGranted,
      );
    }
  }

  void requestCameraPermission(
    BuildContext context, {
    required VoidCallback whenCameraPermissionGranted,
  }) async {
    await PermissionHandlerHelper.request(
      Permission.camera,
      onDeniedCallback: () => showSnackBark(context),
      onGrantedCallback: whenCameraPermissionGranted,
    );
  }
}
