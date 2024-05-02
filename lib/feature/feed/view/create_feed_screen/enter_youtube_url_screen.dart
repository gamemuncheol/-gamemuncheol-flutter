// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/feed/hook/debounce_text_controller_hook.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gamemuncheol/common/util/form_util.dart';
import 'package:gamemuncheol/common/widget/custom_text_form_filed.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/enter_youtube_url_screen_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_youtube_url_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/video_preview.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/bottom_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/step_bar.dart';

class EnterYoutubeUrlScreen extends HookConsumerWidget
    with EnterYoutubeUrlScreenEvent, FormValidator {
  const EnterYoutubeUrlScreen({super.key});

  static const PATH = "/enter_youtube_url_screen";
  static const ROUTE_NAME = "EnterYoutubeUrlScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController youtubeUrlController =
        useDebouncedTextController(
      (query) => submitForm(formKey, whenValid: () {
        enterYoutubeUrl(ref, youtubeUrl: query.trim());
      }),
    );

    return EnterYoutubeUrlScreenScaffold(
      stepBar: FeedStepBar.step3(onLeadingTap: () => onLeadingTap),
      bottomButton: FeedBottomButton(onTap: () {}),
      header:
          const CreateFeedScreenHeader(title: "업로드할 유튜브 영상의\nurl을 입력해 주세요."),
      textField: Form(
        key: formKey,
        child: CustomTextFormField(
          validator: validator,
          textEditingController: youtubeUrlController,
          isUnderLineFormField: true,
          hintText: "유튜브 url을 입력해 주세요.",
        ),
      ),
      videoPreview: const VideoPreview(),
    );
  }
}
