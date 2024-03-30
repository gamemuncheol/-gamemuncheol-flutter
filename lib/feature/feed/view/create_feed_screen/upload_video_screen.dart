// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/layout/blur_layout.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/feature/feed/provider/upload_video_provider.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/upload_video_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/app_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/next_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/upload_video_screen_event.dart';

class UploadVideoScreen extends HookConsumerWidget with UploadVideoScreenEvent {
  const UploadVideoScreen({
    super.key,
  });

  static const PATH = "/upload_video_screen";
  static const ROUTE_NAME = "UploadVideoScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> fromGallery = useState(true);

    listenState(context, ref);

    return BlurLayout<Loading>(
      provider: uploadVideoNotiferProvider,
      child: UploadVideoScreenScaffold(
        appBar: renderAppBar(),
        nextButton: renderNextButton(
          context,
          ref,
          fromGallery: fromGallery,
        ),
        header: renderHeader(),
        videoFromGallaryButton: renderVideoFromGallaryButton(
          fromGallery: fromGallery,
        ),
        videoFromUrlButton: renderVideoFromUrlButton(
          fromGallery: fromGallery,
        ),
      ),
    );
  }

  Widget renderAppBar() {
    return const CreateFeedScreenAppBar(
      currentStep: 2,
    );
  }

  Widget renderNextButton(
    BuildContext context,
    WidgetRef ref, {
    required ValueNotifier<bool> fromGallery,
  }) {
    final TextStyle textStyle = TextStyleBuilder()
        .withColor(AppColor.PRIMARY_WITHE)
        .withFontSize(20)
        .build();

    const BoxDecoration buttonDecoration = BoxDecoration(
      color: AppColor.PRIMARY_BLUE,
    );

    return CreateFeedScreenNextButton(
      onTap: () => fromGallery.value ? selectVideo(context, ref) : null,
      text: "다음",
      textStyle: textStyle,
      buttonDecoration: buttonDecoration,
    );
  }

  Widget renderHeader() {
    return const CreateFeedScreenHeader(
      title: "플레이한 영상을 업로드\n해 주세요.",
    );
  }

  Widget renderVideoFromGallaryButton({
    required ValueNotifier<bool> fromGallery,
  }) {
    return renderButton(
      selected: fromGallery.value,
      label: "갤러리, 카메라 업로드",
      onTap: () => useGallery(fromGallery: fromGallery),
    );
  }

  Widget renderVideoFromUrlButton({
    required ValueNotifier<bool> fromGallery,
  }) {
    return renderButton(
      selected: !fromGallery.value,
      label: "유튜브 url 업로드",
      onTap: () => useUrl(fromGallery: fromGallery),
    );
  }

  Widget renderButton({
    required bool selected,
    required String label,
    required VoidCallback onTap,
  }) {
    final BoxDecoration buttonDecoration = BoxDecoration(
      color: AppColor.PRIMARY_WITHE,
      borderRadius: BorderRadius.circular(64),
      border: Border.all(
        color: selected ? AppColor.PRIMARY_BLUE : AppColor.NATURAL_04,
      ),
    );

    TextStyle labelStyle = TextStyleBuilder()
        .withColor(
          selected ? AppColor.PRIMARY_BLUE : AppColor.NATURAL_04,
        )
        .withBold()
        .build();

    const double buttonWidth = 357;
    const double buttonHeight = 64;

    return GestureDetector(
      onTap: onTap,
      child: ContainerBuilder()
          .withSize(
            width: buttonWidth,
            height: buttonHeight,
          )
          .withBoxDecoration(buttonDecoration)
          .withChild(
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.abc),
                  Text(
                    label,
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
