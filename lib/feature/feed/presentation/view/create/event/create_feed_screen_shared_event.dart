import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/service/permission/permission_handler_service.dart';

mixin CreateFeedScreenSharedEvent {
  Future<ExtraData?> checkPermission() async {
    bool hasGalleryPermission = Platform.isAndroid
        ? true
        : await PermissionHandlerService.checkPermission(Permission.photos);

    bool hasCameraPermission =
        await PermissionHandlerService.checkPermission(Permission.camera);

    if (!hasGalleryPermission || !hasCameraPermission) {
      final ExtraData extraData = ExtraData({
        "hasGalleryPermission": hasGalleryPermission,
        "hasCameraPermission": hasCameraPermission,
      });

      return extraData;
    }

    return null;
  }
}
