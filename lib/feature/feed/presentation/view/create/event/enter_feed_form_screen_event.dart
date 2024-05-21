// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/util/form_validator.dart';
import 'package:gamemuncheol/feature/feed/model/tag_model.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/change_thumbnail_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/create_feed_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/change_thumb_image_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

mixin EnterFeedFormScreenEvent {
  void onLeadingTap() => locator.navKey.context.pop();

  void onNextButtonTap(
    WidgetRef ref, {
    required GlobalKey<FormState> formKey,
    required String title,
    required String description,
    required ValueNotifier<List<TagModel>> tags,
  }) {
    FormValidator.submitForm(
      formKey,
      whenValid: () async {
        final Uint8List byteThumbImage =
            ref.read(changeThumbNailNotifierProvider).pState.data;

        final Directory directory = await getTemporaryDirectory();

        // 1.파일 경로 생성
        final String filePath = '${directory.path}/tempo.jpg';

        // 2. 빈 파일 생성
        final File thumbImageFile = File(filePath);

        // 3. 파일에 데이터 쓰기
        final File thumbImageFileWritten =
            await thumbImageFile.writeAsBytes(byteThumbImage);

        // 4. 파일 경로
        final String path = thumbImageFileWritten.path;
        final int lastSeparator = path.lastIndexOf(Platform.pathSeparator);

        var newPath = "${path.substring(0, lastSeparator + 1)}tempo.png";

        final thumbImageFileRenamed =
            await thumbImageFileWritten.rename(newPath);

        print(thumbImageFileRenamed.absolute);

        ref
            .read(createFeedNotifierProvider.notifier)
            .uploadThumbImage(thumbImageFileRenamed);
      },
    );
  }

  void pushChangeThumbImageScreen(ExtraData? extraData) {
    locator.navKey.context.push(ChangeThumbImageScreen.PATH, extra: extraData);
  }

  void updateOverlay(
    BuildContext context, {
    required ValueNotifier<OverlayEntry?> overlayEntry,
    required TextEditingController tagFieldController,
    required GlobalKey tagFieldKey,
    required LayerLink layerLink,
    required VoidCallback onTap,
  }) {
    overlayEntry.value?.remove();

    if (tagFieldController.text.trim().isEmpty) {
      overlayEntry.value = null;
      return;
    }

    final RenderBox renderBox =
        tagFieldKey.currentContext!.findRenderObject() as RenderBox;
    final Size size = renderBox.size;

    final OverlayEntry newOverlay = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 4.0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Text(
                  tagFieldController.text,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlayEntry.value = newOverlay;
    Overlay.of(context).insert(overlayEntry.value!);
  }

  void removeTag({
    required ValueNotifier<List<TagModel>> tags,
    required int tagId,
  }) {
    final List<TagModel> newTags = List.from(tags.value);
    newTags.remove(tags.value.where((e) => e.id == tagId).first);
    tags.value = newTags;
  }

  void addTag({
    required ValueNotifier<List<TagModel>> tags,
    required TagModel newTag,
  }) {
    final List<TagModel> newTags = List.from(tags.value);
    newTags.add(newTag);
    tags.value = newTags;
  }
}
