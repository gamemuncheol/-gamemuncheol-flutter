// ignore_for_file: constant_identifier_names

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/widget/square_button.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/enter_feed_form_screen_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_form.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/step_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/tags_field.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/thumbnail.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_feed_form_screen_scaffold.dart';

class EnterFeedFormScreen extends HookWidget with EnterFeedFormScreenEvent {
  const EnterFeedFormScreen({super.key});

  static const PATH = "/enter_feed_form_screen";
  static const ROUTE_NAME = "EnterFeedFormScreen";

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController titleController = useTextEditingController();
    final TextEditingController descriptionController =
        useTextEditingController();

    return EnterFeedFormScreenScaffold(
      stepBar: FeedStepBar.step4(onLeadingTap: () => onActionsTap(context)),
      header: renderHeader(),
      thumbnail: const SizedBox(),
      // thumbnail: renderThumbNail(),
      form: FeedForm(
        formKey: formKey,
        titleController: titleController,
        descriptionController: descriptionController,
      ),
      images: const SizedBox(),
      tags: TagsField(),
      bottomButton: renderNextButton(context, onTap: () {}),
    );
  }

  Widget renderNextButton(
    BuildContext context, {
    required VoidCallback onTap,
  }) {
    final TextStyle labelStyle = context.textStyleTheme.body2R
        .copyWith(color: context.colorTheme.onPrimaryBlue);

    final BoxDecoration buttonDecoration =
        BoxDecoration(color: context.colorTheme.primaryBlue);

    return SquareButton(
      onTap: onTap,
      label: "완료",
      labelStyle: labelStyle,
      buttonDecoration: buttonDecoration,
    );
  }

  Widget renderHeader() {
    return const CreateFeedScreenHeader(
      title: "구체적인 정보를 입력해\n주세요.",
    );
  }

  Widget renderThumbNail() {
    return const Thumbnail();
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
}
