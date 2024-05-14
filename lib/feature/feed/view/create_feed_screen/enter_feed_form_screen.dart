// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/service/dialog_service.dart';
import 'package:gamemuncheol/common/presentation/view/base_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/event/enter_feed_form_screen_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/event/permission_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_bottom_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_form.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/step_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/tag_field.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/thumb_image.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_feed_form_screen_scaffold.dart';

class EnterFeedFormScreen extends BaseScreen
    with EnterFeedFormScreenEvent, DialogService, CreateFeedScreenSharedEvent {
  EnterFeedFormScreen({super.key});

  static const PATH = "/enter_feed_form_screen";
  static const ROUTE_NAME = "EnterFeedFormScreen";

  @override
  bool get resizeToAvoidBottomInset => false;

  @override
  AppBar? buildAppBar() => null;

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController titleController = useTextEditingController();
    final TextEditingController descriptionController =
        useTextEditingController();

    return EnterFeedFormScreenScaffold(
      stepBar: buildStepBar(onLeadingTap: onLeadingTap),
      bottomButton: buildBottomButton(onTap: () {}),
      header: buildHeader(),
      thumbImage: buildThumbImage(
        pushChangeThumbImageScreen: () async {
          pushChangeThumbImageScreen(await checkPermission());
        },
      ),
      form: buildFeedForm(
        formKey: formKey,
        titleController: titleController,
        descriptionController: descriptionController,
      ),
      tags: buildTagFiled(),
    );
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

  Widget buildBottomButton({required VoidCallback onTap}) {
    return FeedBottomButton(onTap: onTap);
  }

  Widget buildStepBar({required VoidCallback onLeadingTap}) {
    return FeedStepBar.step4(onLeadingTap: onLeadingTap);
  }

  Widget buildHeader() {
    return const FeedScreenHeader(title: "구체적인 정보를 입력해\n주세요.");
  }

  Widget buildThumbImage({
    required VoidCallback pushChangeThumbImageScreen,
  }) {
    return ThumbImage.thumbImageChangeButton(
      onTap: pushChangeThumbImageScreen,
    );
  }

  Widget renderFormField({
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

  Widget buildTagFiled() {
    return TagField(
      updateOverlay: updateOverlay,
      addTag: addTag,
      removeTag: removeTag,
    );
  }
}
