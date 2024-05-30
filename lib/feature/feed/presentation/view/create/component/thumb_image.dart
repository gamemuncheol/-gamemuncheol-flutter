import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/change_thumb_image_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/component/loading_indicator.dart';

class ThumbImage extends HookConsumerWidget with ThemeProvider {
  final VoidCallback? onPreviewButtonTap;
  final VoidCallback? onThumbImageChangeButtonTap;

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
          ref.read(changeThumbImageNotifierProvider);

      if (!bState.isPState) {
        Future.microtask(() => ref
            .read(changeThumbImageNotifierProvider.notifier)
            .init(ref
                .read(videoUploadNotifierProvider)
                .pState
                .videoModel
                .byteThumbImage));
      }

      return () {};
    }, []);

    final StateMapper<SingleDataState<Uint8List>> bState =
        ref.watch(changeThumbImageNotifierProvider);

    if (onThumbImageChangeButtonTap != null) {
      final double frameWidth = 240.w;
      final double frameHeight = 134.h;

      return SizedBox(
        width: frameWidth,
        height: frameHeight,
        child: Stack(
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

    return SizedBox(
      width: frameWidth,
      height: frameHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          buildThumbImage(bState: bState),
          buildPreivewButton(
            onTap: onPreviewButtonTap!,
          )
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
        pState: (pState) => Image.memory(pState.data, fit: BoxFit.cover),
        loading: () {
          final Uint8List? cache = bState.hasCache ? bState.pState.data : null;

          if (cache != null) {
            return Image.memory(
              cache,
              fit: BoxFit.cover,
            );
          }

          return const LoadingIndicator();
        },
        error: (message) {
          final Uint8List? cache = bState.hasCache ? bState.pState.data : null;

          if (cache != null) {
            return Image.memory(
              cache,
              fit: BoxFit.cover,
            );
          }

          // 디자이너님께 기본 썸네일 만들어 달라고 하기 기억
          return Image.asset(
            AppAsset.THUMB_IMAGE_BASIC,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget buildThumbImageChangeButton({
    required VoidCallback onTap,
  }) {
    const String label = "썸네일 변경";

    final double horizontalPadding = 16.w;
    final double verticalPadding = 9.h;

    final buttonDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: colorTheme.primaryWhite,
        width: 1.7,
      ),
    );

    final TextStyle labelStyle =
        textStyleTheme.body4R.copyWith(color: colorTheme.primaryWhite);

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: buttonDeco,
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  margin: EdgeInsets.only(bottom: verticalPadding * 1.5),
                  child: Center(
                    child: Text(
                      label,
                      style: labelStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPreivewButton({required VoidCallback onTap}) {
    const String label = "미리보기";

    final buttonHeight = 50.h;
    final buttonDeco = BoxDecoration(color: colorTheme.transParent);

    final labelStyle =
        textStyleTheme.body3M.copyWith(color: colorTheme.primaryWhite);

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: buttonHeight,
            decoration: buttonDeco,
            child: Center(
              child: Text(
                label,
                style: labelStyle,
              ),
            ),
          )),
    );
  }
}
