import 'dart:io';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/common/service/permission/permission_handler_service.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

mixin ManagePermissionScreenEvent {
  void onCloseActionIconTap() {
    locator.navKey.context.pop();
  }

  void requestGalleryPermission({
    required VoidCallback onDeniedCallback,
    required VoidCallback onGrantedCallback,
  }) async {
    if (!Platform.isAndroid) {
      EasyDebounce.debounce(
        "photos",
        const Duration(milliseconds: 500),
        () async {
          await PermissionHandlerService.request(
            Permission.photos,
            onDeniedCallback: onDeniedCallback,
            onGrantedCallback: onGrantedCallback,
          );
        },
      );
    }
  }

  void requestCameraPermission({
    required VoidCallback onDeniedCallback,
    required VoidCallback onGrantedCallback,
  }) async {
    EasyDebounce.debounce(
      "camera",
      const Duration(milliseconds: 500),
      () async {
        await PermissionHandlerService.request(
          Permission.camera,
          onDeniedCallback: onDeniedCallback,
          onGrantedCallback: onGrantedCallback,
        );
      },
    );
  }
}
