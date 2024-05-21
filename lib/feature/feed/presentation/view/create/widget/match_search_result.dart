import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/widget/loading_indicator.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/match_card.dart';

class MatchSearchResult extends ConsumerWidget {
  final Function(WidgetRef ref, {required MatchUser myself}) selectMySelf;
  const MatchSearchResult({super.key, required this.selectMySelf});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double bottomPadding = 24.h;
    final StateMapper<MatchState> state = ref.watch(matchNotiferProvider);

    return state.whenBState(
      initial: () => const SizedBox(),
      loading: () => const Center(
        child: LoadingIndicator(),
      ),
      error: (message) => Center(
        child: Text(message),
      ),
      pState: (matchState) {
        final Match match = matchState.match;

        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            bottom: bottomPadding,
          ),
          itemCount: match.matchUsers.length,
          itemBuilder: (context, index) {
            final MatchUser matchUser = match.matchUsers[index];
            final bool isMySelf =
                matchState.isMatchSelected && matchUser == matchState.myself;

            return Padding(
              padding: EdgeInsets.only(
                bottom: bottomPadding,
              ),
              child: GestureDetector(
                onTap: () => selectMySelf(ref, myself: matchUser),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      isMySelf
                          ? AppAsset.CHECKBOX_FILLED
                          : AppAsset.CHECKBOX_BLANK,
                    ),
                    Gap(16.w),
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
