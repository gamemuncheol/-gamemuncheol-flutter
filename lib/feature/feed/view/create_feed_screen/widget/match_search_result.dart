import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/widget/loading_indicator.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/match_card.dart';

class MatchSearchResult extends ConsumerWidget {
  final Function(WidgetRef ref, {required MatchUser myself}) selectMySelf;
  const MatchSearchResult({super.key, required this.selectMySelf});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double bottomPadding = 24.h;
    final StateMapper<MatchState> state = ref.watch(matchNotiferProvider);

    return state.whenBState(
      initial: () => const SizedBox(),
      loading: () => const LoadingIndicator(),
      error: (message) => Center(child: Text(message)),
      pState: (matchState) {
        final Match match = matchState.match;

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
                .indexMethod()
                .setPadding(bottom: bottomPadding)
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
                          child: MatchCard(
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
