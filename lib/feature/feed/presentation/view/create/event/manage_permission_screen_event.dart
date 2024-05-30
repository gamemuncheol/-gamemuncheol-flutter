import 'dart:io';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/common/service/permission/permission_handler_service.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/manage_permission_screen.dart';

mixin ManagePermissionScreenState on BaseScreenV2State<ManagePermissionScreen> {
  late final hasCameraPermission = ValueNotifier(widget.hasCameraPermission);
  late final hasGalleryPermission = ValueNotifier(widget.hasGalleryPermission);

  Widget get snackBarContent;

  void onLeadingTap() {
    context.pop(hasGalleryPermission.value);
  }

  void requestGalleryPermission() async {
    if (!Platform.isAndroid) {
      EasyDebounce.debounce(
        "photos",
        const Duration(milliseconds: 500),
        () async {
          await PermissionHandlerService.request(
            Permission.photos,
            onDeniedCallback: () {
              showSnackBar(
                content: snackBarContent,
              );
            },
            onGrantedCallback: () {
              hasGalleryPermission.value = true;
            },
          );
        },
      );
    }
  }

  void requestCameraPermission() async {
    EasyDebounce.debounce(
      "camera",
      const Duration(milliseconds: 500),
      () async {
        await PermissionHandlerService.request(
          Permission.camera,
          onDeniedCallback: () {
            showSnackBar(
              content: snackBarContent,
            );
          },
          onGrantedCallback: () {
            hasCameraPermission.value = true;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    hasGalleryPermission.dispose();
    hasCameraPermission.dispose();
    super.dispose();
  }
}
