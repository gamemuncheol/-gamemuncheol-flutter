import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/search_match_screen_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/match_history_card.dart';

class MatchSearchResult extends ConsumerWidget with SearchMatchScreenEvent {
  const MatchSearchResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double bottomPadding = 24.h;
    final BaseState<MatchState> state = ref.watch(matchNotiferProvider);

    return state.when(
      initial: () {
        return const SizedBox();
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(
            color: context.colorTheme.primaryBlue,
          ),
        );
      },
      error: (error) {
        return Center(child: Text(error.message));
      },
      data: (matchState) {
        final MatchHistory match = matchState.getMatch;

        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: bottomPadding),
          itemCount: match.matchUsers.length,
          itemBuilder: (context, index) {
            final MatchUser matchUser = match.matchUsers[index];
            final bool isMySelf =
                matchState.isMatchSelected && matchUser == matchState.myself;

            return PaddingBuilder()
                .setPadding(
                  bottom: bottomPadding,
                )
                .setChild(
                  GestureDetector(
                    onTap: () => selectMySelf(ref, myself: matchUser),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          isMySelf
                              ? AppAsset.CHECKBOX_FILLED_VER_PATH
                              : AppAsset.CHECKBOX_BLANK_VER_PATH,
                        ),
                        const Gap(16).setWidth(),
                        Expanded(
                          child: MatchHistoryCard(
                            matchUser: matchUser,
                            gameCreation: match.gameCreation,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
          },
        );
      },
    );
  }
}
