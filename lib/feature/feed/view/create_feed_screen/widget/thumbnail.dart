import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/model/common_error.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/feature/feed/provider/change_thumbnail_provider.dart';
import 'package:gamemuncheol/feature/feed/provider/upload_video_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/enter_feed_form_screen_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_container.dart';

class Thumbnail extends HookConsumerWidget with EnterFeedFormScreenEvent {
  const Thumbnail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref
          .read(changeThumbNailNotifierProvider.notifier)
          .init(videoFile: ref.read(uploadVideoNotiferProvider).pState.videoFile!);
      return () {};
    });

    const double frameWidth = 240;
    const double frameHeight = 134;

    final BaseState<Uint8List> state = ref.watch(changeThumbNailNotifierProvider);

    return ContainerBuilder()
        .setWidth(frameWidth)
        .setHeigh(frameHeight)
        .setChild(
          Stack(
            fit: StackFit.expand,
            children: [
              state.whenWithCache(
                data: (data) {
                  return Image.memory(data, fit: BoxFit.cover);
                },
                loading: (valueOrNull) {
                  return renderLoading(context, cache: valueOrNull);
                },
                error: (error, valueOrNull) {
                  return renderError(error: error, cache: valueOrNull);
                },
              ),
              renderThumbnailChangeButton(context, ref),
            ],
          ),
        );
  }

  Widget renderLoaded({required Uint8List data}) {
    return Image.memory(data, fit: BoxFit.cover);
  }

  Widget renderError({
    required ErrorWithMessage error,
    required Uint8List? cache,
  }) {
    if (cache != null) {
      return Image.memory(cache, fit: BoxFit.cover);
    }

    return Center(
      child: Text(error.message),
    );
  }

  Widget renderLoading(
    BuildContext context, {
    required Uint8List? cache,
  }) {
    if (cache != null) {
      return Image.memory(cache, fit: BoxFit.cover);
    }

    return Center(
      child: CircularProgressIndicator(
        color: context.colorTheme.primaryBlue,
      ),
    );
  }

  Widget renderThumbnailChangeButton(BuildContext context, WidgetRef ref) {
    const double frameHeight = 50;
    final BoxDecoration buttonDeco =
        BoxDecoration(color: context.colorTheme.primaryBlack.withOpacity(0.8));

    final TextStyle textStyle = context.textStyleTheme.body4R
        .copyWith(color: context.colorTheme.primaryWhite);

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          changeThumbnail(ref);
        },
        child: ContainerBuilder()
            .setHeigh(frameHeight * 0.33)
            .setBoxDecoration(buttonDeco)
            .setChild(
              Center(
                child: Text("썸네일 변경", style: textStyle),
              ),
            ),
      ),
    );
  }
}
