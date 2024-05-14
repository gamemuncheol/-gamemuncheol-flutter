import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/presentation/widget/loading_indicator.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/preview_button.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:gamemuncheol/feature/feed/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/state/video_upload_state.dart';

class VideoPreview extends ConsumerWidget {
  final String? Function(String? value) validator;
  final void Function(
    BuildContext context, {
    required String youtubeUrl,
  }) onPreviewButtonTap;
  const VideoPreview({
    super.key,
    required this.validator,
    required this.onPreviewButtonTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final frameWidth = MediaQuery.sizeOf(context).width;
    final frameHeight = MediaQuery.sizeOf(context).width / 16 * 9;

    final StateMapper<VideoUploadState> bState =
        ref.watch(videoUploadNotifierProvider);

    return SizedBoxBuilder()
        .setWidth(frameWidth)
        .setHeigh(frameHeight)
        .setChild(
          useScreenUitl: false,
          Stack(
            fit: StackFit.expand,
            children: [
              buildThumbImage(bState: bState),
              buildPreviewButton(
                onTap: () {
                  onPreviewButtonTap(
                    context,
                    youtubeUrl: bState.pState.youtubeUrl,
                  );
                },
              ),
            ],
          ),
        );
  }

  Widget buildThumbImage({required StateMapper<VideoUploadState> bState}) {
    return bState.whenBState(
      error: (message) => Center(child: Text(message)),
      loading: () => const LoadingIndicator(),
      pState: (pState) {
        return pState.whenPState(
          youtubeUrlSelected: (youtubeUrl, byteThumbImage) {
            return Image.memory(byteThumbImage, fit: BoxFit.cover);
          },
          videoFileSelected: (videoFile, byteThumbImage) {
            return const SizedBox();
          },
        );
      },
      orElse: () => const SizedBox(),
    );
  }

  Widget buildPreviewButton({required VoidCallback onTap}) {
    return PreviewButton(onTap: onTap);
  }
}
