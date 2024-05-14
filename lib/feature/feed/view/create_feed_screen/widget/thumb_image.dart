import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/widget/loading_indicator.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/preview_button.dart';
import 'package:gamemuncheol/feature/feed/provider/change_thumbnail_provider.dart';
import 'package:gamemuncheol/feature/feed/provider/video_upload_provider.dart';

class ThumbImage extends HookConsumerWidget {
  final VoidCallback? onThumbImageChangeButtonTap;
  final VoidCallback? onPreviewButtonTap;

  const ThumbImage({
    super.key,
    this.onThumbImageChangeButtonTap,
    this.onPreviewButtonTap,
  });

  factory ThumbImage.thumbImageChangeButton({required VoidCallback onTap}) {
    return ThumbImage(onThumbImageChangeButtonTap: onTap);
  }

  factory ThumbImage.previewButton({required VoidCallback ontTap}) {
    return ThumbImage(onPreviewButtonTap: ontTap);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final StateMapper<SingleDataState<Uint8List>> bState =
          ref.read(changeThumbNailNotifierProvider);

      if (!bState.isPState) {
        Future.microtask(() => ref
            .read(changeThumbNailNotifierProvider.notifier)
            .init(ref.read(videoUploadNotifierProvider).pState.byteThumbImage));
      }
      
      return () {};
    }, []);

    final StateMapper<SingleDataState<Uint8List>> bState =
        ref.watch(changeThumbNailNotifierProvider);

    // viewOnly
    if (onThumbImageChangeButtonTap != null) {
      const double frameWidth = 240;
      const double frameHeight = 134;

      return ContainerBuilder()
          .setWidth(frameWidth)
          .setHeigh(frameHeight)
          .setChild(
            Stack(
              fit: StackFit.expand,
              children: [
                buildThumbImage(bState: bState),
                buildThumbImageChangeButton(
                  onTap: onThumbImageChangeButtonTap!,
                ),
              ],
            ),
          );
    }

    final frameWidth = MediaQuery.sizeOf(context).width;
    final frameHeight = MediaQuery.sizeOf(context).width / 16 * 9;

    return ContainerBuilder()
        .setWidth(frameWidth)
        .setHeigh(frameHeight)
        .setChild(
          useScreenUtil: false,
          Stack(
            fit: StackFit.expand,
            children: [
              buildThumbImage(bState: bState),
              buildPreivewButton(onTap: onPreviewButtonTap!)
            ],
          ),
        );
  }

  Widget buildThumbImage({
    required StateMapper<SingleDataState<Uint8List>> bState,
  }) {
    return Hero(
      tag: const ValueKey("buildThumbImage"),
      child: bState.whenBState(
        orElse: () {
          return const SizedBox();
        },
        pState: (pState) {
          return Image.memory(pState.data, fit: BoxFit.cover);
        },
        loading: () {
          final Uint8List? cache = bState.hasCache ? bState.pState.data : null;

          if (cache != null) {
            return Image.memory(cache, fit: BoxFit.cover);
          }

          return const LoadingIndicator();
        },
        error: (message) {
          final Uint8List? cache = bState.hasCache ? bState.pState.data : null;

          if (cache != null) {
            return Image.memory(cache, fit: BoxFit.cover);
          }

          return Center(child: Text(message));
        },
      ),
    );
  }

  Widget buildThumbImageChangeButton({
    required VoidCallback onTap,
  }) {
    const double frameWidth = 98;
    const double frameHeight = 34;

    const double horizontalPadding = 16;
    const double verticalPadding = 9;

    return Builder(
      builder: (context) {
        final BoxDecoration buttonDeco = BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: context.colorTheme.primaryWhite, width: 1.7),
        );

        final TextStyle labelStyle = context.textStyleTheme.body4R
            .copyWith(color: context.colorTheme.primaryWhite);

        return Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: onTap,
            child: ContainerBuilder()
                .setWidth(frameWidth)
                .setHeigh(frameHeight)
                .setPadding(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                )
                .setMargin(bottom: verticalPadding * 1.5)
                .setBoxDecoration(buttonDeco)
                .setChild(Center(child: Text("썸네일 변경", style: labelStyle))),
          ),
        );
      },
    );
  }

  Widget buildPreivewButton({required VoidCallback onTap}) {
    return PreviewButton(onTap: onTap);
  }
}
