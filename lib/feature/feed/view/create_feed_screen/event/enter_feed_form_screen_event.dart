// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/feature/feed/model/tag_model.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/change_thumb_image_screen.dart';

import 'package:go_router/go_router.dart';

mixin EnterFeedFormScreenEvent {
  void onLeadingTap() => locator.navKey.context.pop();

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
    required String tagId,
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
