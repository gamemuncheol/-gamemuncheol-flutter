import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/service/permission/permission_handler_service.dart';
import 'package:gamemuncheol/common/service/snack_bar_service.dart';
import 'package:permission_handler/permission_handler.dart';

mixin ManagePermissionScreenEvent {
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
    SnackBarUtil.snackBar(context, text: "권한을 허용해 주세요.");
  }

  void requestGalleryPermission(
    BuildContext context, {
    required VoidCallback whenGalleryPermissionGranted,
  }) async {
    if (!Platform.isAndroid) {
      await PermissionHandlerService.request(
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
    await PermissionHandlerService.request(
      Permission.camera,
      onDeniedCallback: () => showSnackBark(context),
      onGrantedCallback: whenCameraPermissionGranted,
    );
  }
}
