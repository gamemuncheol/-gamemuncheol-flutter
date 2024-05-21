import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/di/locator.dart';

mixin YoutubeUrlPreviewScreenEvent {
  onLeadingTap() {
    locator.navKey.context.pop();
  }
}
