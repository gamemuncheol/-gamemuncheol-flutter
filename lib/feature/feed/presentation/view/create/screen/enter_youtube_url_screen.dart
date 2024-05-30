// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/common/presentation/component/custom_text_form_filed.dart';
import 'package:gamemuncheol/common/presentation/component/loading_indicator.dart';
import 'package:gamemuncheol/common/presentation/component/debounce_text_controller_hook.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/enter_youtube_url_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/enter_youtube_url_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_app_bar.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_header.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/thumb_image.dart';



class EnterYoutubeUrlScreen extends BaseScreenV2 {
  const EnterYoutubeUrlScreen({super.key});

  static const PATH = "/$NAME";
  static const NAME = "ENTER_YOUTUBE_URL_SCREEN";

  @override
  BaseScreenV2State<EnterYoutubeUrlScreen> createState() =>
      _EnterYoutubeUrlScreenV2State();
}

class _EnterYoutubeUrlScreenV2State
    extends BaseScreenV2State<EnterYoutubeUrlScreen>
    with DefaultLayout, EnterYoutubeUrlScreenState {
  @override
  PreferredSize? buildAppBar() {
    return CreateFeedScreenAppBar.step3(
      onLeadingTap: onLeadingTap,
    ).toAppBar();
  }

  @override
  Widget buildBody() {
    final youtubeUrlController = useDebouncedTextController(enterYoutubeUrl);

    return EnterYoutubeUrlScreenLayout(
      bottomButton: _buildNextButton(),
      header: _buildHeader(),
      textField: _buildTextField(
        controller: youtubeUrlController,
      ),
      videoPreview: _buildThumbImage(),
    );
  }

  Widget _buildNextButton() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, child) {
        final bState = ref.watch(videoUploadNotifierProvider);
        final bool isAble = bState.isPState && bState.pState.isYoutubeUrlSelect;

        return isAble
            ? CreateFeedScreenNextButton(onTap: onNextButtonTap)
            : CreateFeedScreenNextButton.disAble();
      },
    );
  }

  Widget _buildHeader() {
    const String title = "업로드할 유튜브 영상의\nurl을 입력해 주세요.";

    return const CreateFeedScreenHeader(
      title: title,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
  }) {
    const String hintText = "유튜브 url을 입력해 주세요.";

    return CustomTextFormField(
      maxLines: 1,
      isUnderLineTextFormField: true,
      textEditingController: controller,
      hintText: hintText,
    );
  }

  Widget _buildThumbImage() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, child) {
        final bState = ref.watch(videoUploadNotifierProvider);

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
                  onPreviewButtonTap(
                      youtubeUrl: bState.pState.videoModel.videoUrl);
                },
              ),
            );
          },
        );
      },
    );
  }
}
