import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/upload_video_screen_event.dart';
import 'package:gap/gap.dart';

class VideoUploadButtons extends ConsumerWidget with UploadVideoScreenEvent {
  final ValueNotifier<bool> fromGallery;

  const VideoUploadButtons({
    super.key,
    required this.fromGallery,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        renderButton(
          context,
          selected: fromGallery.value,
          label: "갤러리, 카메라 업로드",
          onTap: () => useGallery(fromGallery: fromGallery),
        ),
        const Gap(24).setHeight(),
        renderButton(
          context,
          selected: !fromGallery.value,
          label: "유튜브 url 업로드",
          onTap: () => useYoutubeUrl(fromGallery: fromGallery),
        ),
      ],
    );
  }

  Widget renderButton(
    BuildContext context, {
    required bool selected,
    required String label,
    required VoidCallback onTap,
  }) {
    final BoxDecoration buttonDecoration = BoxDecoration(
      color: context.colorTheme.background,
      borderRadius: BorderRadius.circular(64),
      border: Border.all(
        color: selected
            ? context.colorTheme.primaryBlue
            : context.colorTheme.natural04,
      ),
    );

    TextStyle labelStyle = context.textStyleTheme.body4M.copyWith(
      color: selected
          ? context.colorTheme.primaryBlue
          : context.colorTheme.natural04,
    );

    const double buttonWidth = 357;
    const double buttonHeight = 64;

    return GestureDetector(
      onTap: onTap,
      child: ContainerBuilder()
          .setWidth(buttonWidth)
          .setHeigh(buttonHeight)
          .setBoxDecoration(buttonDecoration)
          .setChild(
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
