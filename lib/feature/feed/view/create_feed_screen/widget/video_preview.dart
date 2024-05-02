import 'package:cached_network_image/cached_network_image.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/feature/feed/provider/upload_video_provider.dart';
import 'package:gamemuncheol/feature/feed/state/upload_video_state.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/enter_youtube_url_screen_event.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPreview extends HookConsumerWidget with EnterYoutubeUrlScreenEvent {
  const VideoPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double thumbNailWidth = 358;
    const double thumbNailHeight = 219;

    final ValueNotifier<bool> canPreView = useState(false);
    final BaseState<VideoUploadState> state =
        ref.watch(uploadVideoNotiferProvider);

    return ContainerBuilder()
        .setWidth(thumbNailWidth)
        .setHeigh(thumbNailHeight)
        .setChild(
          Stack(
            fit: StackFit.expand,
            children: [
              buildThumbImage(
                state: state,
                canPreView: canPreView,
                ablePreview: () {
                  ablePreview(canPreView: canPreView);
                },
                disablePreview: () {
                  disablePreview(canPreView: canPreView);
                },
              ),
              if (canPreView.value)
                buildPreviewButton(
                  context,
                  onTap: () {
                    if (canPreView.value) {
                      watchPreview(context, ref);
                    }
                  },
                ),
            ],
          ),
        );
  }

  Widget buildThumbImage({
    required BaseState<VideoUploadState> state,
    required ValueNotifier<bool> canPreView,
    required VoidCallback ablePreview,
    required VoidCallback disablePreview,
  }) {
    return state.whenBState(
      pState: (pState) {
        return pState.whenPState(
          youtubeUrlSelected: (youtubeUrl) {
            final String? videoId = YoutubePlayer.convertUrlToId(youtubeUrl);
            final String thumbUrl = "https://img.youtube.com/vi/$videoId/0.jpg";

            return CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: thumbUrl,
              progressIndicatorBuilder: (context, url, progress) {
                if (!canPreView.value) {
                  Future.microtask(ablePreview);
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: context.colorTheme.primaryBlue,
                  ),
                );
              },
              errorListener: (value) {
                if (canPreView.value) {
                  Future.microtask(disablePreview);
                }
              },
              errorWidget: (context, url, error) {
                return Center(child: Text(NoSuchYoutubeUrl().message));
              },
            );
          },
        );
      },
      orElse: () {
        return const SizedBox();
      },
    );
  }

  Widget buildPreviewButton(
    BuildContext context, {
    required VoidCallback onTap,
  }) {
    const double frameHeight = 50;
    final BoxDecoration buttonDeco = BoxDecoration(
      color: context.colorTheme.primaryBlack.withOpacity(0.8),
    );

    final TextStyle textStyle = context.textStyleTheme.body4R
        .copyWith(color: context.colorTheme.primaryWhite);

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onTap,
        child: ContainerBuilder()
            .setHeigh(frameHeight)
            .setBoxDecoration(buttonDeco)
            .setChild(Center(child: Text("미리보기", style: textStyle))),
      ),
    );
  }
}
