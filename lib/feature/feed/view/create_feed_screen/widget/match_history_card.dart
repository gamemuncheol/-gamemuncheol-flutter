import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/util/app_container.dart';

import 'package:gamemuncheol/common/util/data_state.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:gamemuncheol/feature/feed/provider/search_match_history_provider.dart';
import 'package:gap/gap.dart';

class MatchHistoryCard extends ConsumerWidget {
  const MatchHistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Ds<MatchHistory> state = ref.watch(searchMatchHistoryNotiferProvider);
    return state.onState(
      initial: () => renderGuide(),
      loading: () => renderCircularIndicator(),
      error: (error) => renderErrorWidget(error: error),
      loaded: (matchHistory) =>
          renderMatchHistoryCard(matchHistory: matchHistory),
    );
  }

  Widget renderGuide() {
    const double space1 = 16;
    const double space2 = 20;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(space1).withHeight(),
        SvgPicture.asset(
          AssetPaths.MATCH__INFO_TEXT_PATH,
        ),
        const Gap(space2).withHeight(),
        ContainerBuilder()
            .withSize(
              width: 358,
              height: 212,
            )
            .withChild(
              Image.asset(
                AssetPaths.MATCH__INFO_IMAGE_PATH,
              ),
            ),
      ],
    );
  }

  Widget renderCircularIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget renderErrorWidget({
    required Exception error,
  }) {
    return Center(
      child: Text(error.toString()),
    );
  }

  Widget renderMatchHistoryCard({
    required MatchHistory matchHistory,
  }) {
    return Center(
      child: Text(matchHistory.toString()),
    );
  }
}
