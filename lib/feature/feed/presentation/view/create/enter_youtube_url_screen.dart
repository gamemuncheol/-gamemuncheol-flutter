// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/common/presentation/widget/loading_indicator.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/state/video_upload_state.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/thumb_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gamemuncheol/common/presentation/widget/custom_text_form_filed.dart';
import 'package:gamemuncheol/feature/feed/presentation/hook/debounce_text_controller_hook.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/enter_youtube_url_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/enter_youtube_url_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_header.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/feed_creation_screen_app_bar.dart';

class EnterYoutubeUrlScreen extends BaseScreen with EnterYoutubeUrlScreenEvent {
  EnterYoutubeUrlScreen({super.key});

  static const PATH = "/enter_youtube_url_screen";
  static const NAME = "EnterYoutubeUrlScreen";

  @override
  PreferredSize? buildAppBar(ref) {
    return CreateFeedScreenAppBar.step3(
      onLeadingTap: () => onLeadingTap(ref),
    ).toAppBar();
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final TextEditingController youtubeUrlController =
        useDebouncedTextController(
      (query) {
        enterYoutubeUrl(ref, youtubeUrl: query.trim());
      },
    );

    return EnterYoutubeUrlScreenLayout(
      bottomButton: buildNextButton(onTap: onNextButtonTap),
      header: buildHeader(),
      textField: buildTextField(controller: youtubeUrlController),
      videoPreview: buildThumbImage(onPreviewButtonTap: onPreviewButtonTap),
    );
  }

  Widget buildNextButton({required VoidCallback onTap}) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, child) {
        final StateMapper<VideoUploadState> bState =
            ref.watch(videoUploadNotifierProvider);

        final bool isAble = bState.isPState && bState.pState.isYoutubeUrlSelect;

        return isAble
            ? CreateFeedScreenNextButton(onTap: onTap)
            : CreateFeedScreenNextButton.disAble();
      },
    );
  }

  Widget buildHeader() {
    const String title = "업로드할 유튜브 영상의\nurl을 입력해 주세요.";
    return const CreateFeedScreenHeader(
      title: title,
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
  }) {
    const String hintText = "유튜브 url을 입력해 주세요.";

    return CustomTextFormField(
      isUnderLineTextFormField: true,
      textEditingController: controller,
      hintText: hintText,
    );
  }

  Widget buildThumbImage({
    required void Function({required String youtubeUrl}) onPreviewButtonTap,
  }) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, child) {
        final StateMapper<VideoUploadState> bState =
            ref.watch(videoUploadNotifierProvider);

        return bState.whenBState(
          orElse: () {
            return const SizedBox();
          },
          error: (message) => Center(
            child: Text(message),
          ),
          loading: () => const Center(
            child: LoadingIndicator(),
          ),
          pState: (pState) {
            return Center(
              child: ThumbImage.previewButton(
                ontTap: () {
                  onPreviewButtonTap(youtubeUrl: bState.pState.youtubeUrl);
                },
              ),
            );
          },
        );
      },
    );
  }
}
