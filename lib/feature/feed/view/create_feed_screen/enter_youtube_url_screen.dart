// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/state/video_upload_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/presentation/widget/custom_text_form_filed.dart';
import 'package:gamemuncheol/feature/feed/hook/debounce_text_controller_hook.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/event/enter_youtube_url_screen_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_youtube_url_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/video_preview.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_bottom_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/feed_header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/step_bar.dart';

class EnterYoutubeUrlScreen extends HookConsumerWidget
    with EnterYoutubeUrlScreenEvent {
  const EnterYoutubeUrlScreen({super.key});

  static const PATH = "/enter_youtube_url_screen";
  static const ROUTE_NAME = "EnterYoutubeUrlScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController youtubeUrlController =
        useDebouncedTextController(
      (query) {
        enterYoutubeUrl(ref, youtubeUrl: query.trim());
      },
    );

    return EnterYoutubeUrlScreenScaffold(
      stepBar: buildStepBar(onLeadingTap: () => onLeadingTap(context, ref)),
      bottomButton: buildBottomButton(onTap: () => onBottomButtonTap(context)),
      header: buildHeader(),
      textField: buildTextField(controller: youtubeUrlController),
      videoPreview: buildVideoPreview(
        validator: validator,
        onPreviewButtonTap: onPreviewButtonTap,
      ),
    );
  }

  Widget buildStepBar({required VoidCallback onLeadingTap}) {
    return FeedStepBar.step3(onLeadingTap: onLeadingTap);
  }

  Widget buildBottomButton({required VoidCallback onTap}) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, child) {
        final StateMapper<VideoUploadState> bState =
            ref.watch(videoUploadNotifierProvider);

        final bool isAble = bState.isPState && bState.pState.isYoutubeUrlSelect;

        if (isAble) {
          return FeedBottomButton(onTap: onTap);
        }

        return FeedBottomButton.disAble();
      },
    );
  }

  Widget buildHeader() {
    return const FeedScreenHeader(title: "업로드할 유튜브 영상의\nurl을 입력해 주세요.");
  }

  Widget buildTextField({
    required TextEditingController controller,
  }) {
    return CustomTextFormField(
      isUnderLineTextFormField: true,
      textEditingController: controller,
      hintText: "유튜브 url을 입력해 주세요.",
    );
  }

  Widget buildVideoPreview({
    required String? Function(String? value) validator,
    required void Function(
      BuildContext context, {
      required String youtubeUrl,
    }) onPreviewButtonTap,
  }) {
    return VideoPreview(
      validator: validator,
      onPreviewButtonTap: onPreviewButtonTap,
    );
  }
}
