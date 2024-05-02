// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/feature/feed/provider/change_thumbnail_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/tags_field.dart';
import 'package:go_router/go_router.dart';

mixin EnterFeedFormScreenEvent {
  void onActionsTap(BuildContext context) {
    context.pop();
  }

  Future<void> changeThumbnail(WidgetRef ref) async {
    await ref.read(changeThumbNailNotifierProvider.notifier).changeThumbnail();
  }

  void addTag({
    required TagModel tagModel,
    required ValueNotifier<List<TagModel>> tags,
  }) async {
    if (!tags.value.contains(tagModel)) {
      final List<TagModel> newTags = tags.value;
      newTags.add(tagModel);

      tags.value = newTags;
      tags.notifyListeners();
    }
  }

  void removeTag({
    required TagModel tagModel,
    required ValueNotifier<List<TagModel>> tags,
  }) async {
    if (tags.value.contains(tagModel)) {
      tags.value.remove(tagModel);
    }
  }
}
