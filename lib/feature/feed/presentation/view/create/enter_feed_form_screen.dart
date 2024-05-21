// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/feature/feed/model/tag_model.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/enter_feed_form_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/create_feed_screen_shared_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_app_bar.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_form.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_header.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/tag_field.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/thumb_image.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/enter_feed_form_screen_layout.dart';

class EnterFeedFormScreen extends BaseScreen
    with EnterFeedFormScreenEvent, CreateFeedScreenSharedEvent {
  EnterFeedFormScreen({super.key});

  static const PATH = "/enter_feed_form_screen";
  static const NAME = "EnterFeedFormScreen";

  @override
  bool get resizeToAvoidBottomInset => false;

  @override
  PreferredSizeWidget? buildAppBar(ref) {
    return CreateFeedScreenAppBar.step4(onLeadingTap: onLeadingTap).toAppBar();
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController titleController = useTextEditingController();
    final TextEditingController descriptionController =
        useTextEditingController();
    final ValueNotifier<List<TagModel>> tags = useValueNotifier([]);

    return EnterFeedFormScreenLayout(
      bottomButton: buildNextButton(
        onTap: () => onNextButtonTap(
          ref,
          formKey: formKey,
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          tags: tags,
        ),
      ),
      header: buildHeader(),
      thumbImage: buildThumbImage(
        onThumbImageChangeButtonTap: () async {
          pushChangeThumbImageScreen(await checkPermission());
        },
      ),
      form: buildFeedForm(
        formKey: formKey,
        titleController: titleController,
        descriptionController: descriptionController,
      ),
      tags: buildTagFiled(
        tags: tags,
        addTag: addTag,
        removeTag: removeTag,
        updateOverlay: updateOverlay,
      ),
    );
  }

  Widget buildHeader() {
    const String title = "구체적인 정보를 입력해\n주세요.";
    return const CreateFeedScreenHeader(title: title);
  }

  Widget buildFeedForm({
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController descriptionController,
  }) {
    return FeedForm(
      formKey: formKey,
      titleController: titleController,
      descriptionController: descriptionController,
    );
  }

  Widget buildNextButton({required VoidCallback onTap}) {
    return CreateFeedScreenNextButton(onTap: onTap);
  }

  Widget buildThumbImage({
    required VoidCallback onThumbImageChangeButtonTap,
  }) {
    return ThumbImage.thumbImageChangeButton(
      onTap: onThumbImageChangeButtonTap,
    );
  }

  Widget buildTagFiled({
    required ValueNotifier<List<TagModel>> tags,
    required void Function({
      required ValueNotifier<List<TagModel>> tags,
      required TagModel newTag,
    }) addTag,
    required void Function({
      required ValueNotifier<List<TagModel>> tags,
      required int tagId,
    }) removeTag,
    required void Function(
      BuildContext context, {
      required ValueNotifier<OverlayEntry?> overlayEntry,
      required TextEditingController tagFieldController,
      required GlobalKey tagFieldKey,
      required LayerLink layerLink,
      required VoidCallback onTap,
    }) updateOverlay,
  }) {
    return TagField(
      tags: tags,
      addTag: addTag,
      removeTag: removeTag,
      updateOverlay: updateOverlay,
    );
  }
}
