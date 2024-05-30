import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/match_card.dart';
import 'package:gap/gap.dart';

class MatchStakeHolders extends ConsumerWidget with ThemeProvider {
  final bool inMyTeam;
  final void Function({
    required MatchUser stakeHolder,
  }) exceptStakeHolder;
  final void Function({
    required MatchUser stakeHolder,
  }) selectStakeHolder;

  const MatchStakeHolders({
    super.key,
    required this.inMyTeam,
    required this.exceptStakeHolder,
    required this.selectStakeHolder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double verticalPadding = 12.h;

    final MatchState pState = ref.watch(matchNotiferProvider).pState;

    final Match match = pState.match;
    final MatchUser myself = pState.myself;

    final List<MatchUser> myTeam = match.matchUsers.where((matchUser) {
      return matchUser.win == myself.win && matchUser != myself;
    }).toList();

    final List<MatchUser> enemy = match.matchUsers.where((matchUser) {
      return matchUser.win != myself.win;
    }).toList();

    final List<MatchUser> source = inMyTeam ? myTeam : enemy;

    return Column(
      children: (source).map(
        (matchUser) {
          final isSelected =
              pState.isStakeHolderSelected && pState.stakeHolder.id == matchUser.id;

          return Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            child: GestureDetector(
              onTap: () => isSelected
                  ? exceptStakeHolder(stakeHolder: matchUser)
                  : selectStakeHolder(stakeHolder: matchUser),
              child: Container(
                color: colorTheme.background,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      isSelected
                          ? AppAsset.CHECKBOX_FILLED
                          : AppAsset.CHECKBOX_BLANK,
                    ),
                    Gap(16.w),
                    Expanded(
                      child: MatchCard(
                        matchUser: matchUser,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
