import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/widget/match_card.dart';
import 'package:gap/gap.dart';

class StakeHolders extends ConsumerWidget with ThemeServiceProvider {
  final bool inMyTeam;
  final void Function(
    WidgetRef ref, {
    required MatchUser stakeHolder,
  }) exceptStakeHolder;
  final void Function(
    WidgetRef ref, {
    required MatchUser stakeHolder,
  }) selectStakeHolder;

  const StakeHolders({
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

    final bool hasList = pState.isStakeHolderSelected;
    final List<MatchUser> stakeHolders = hasList ? pState.stakeHolders : [];

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
          final bool selected = stakeHolders.contains(matchUser);

          return Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            child: GestureDetector(
              onTap: () => selected
                  ? exceptStakeHolder(ref, stakeHolder: matchUser)
                  : selectStakeHolder(ref, stakeHolder: matchUser),
              child: Container(
                color: colorTheme.background,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      selected
                          ? AppAsset.CHECKBOX_FILLED
                          : AppAsset.CHECKBOX_BLANK,
                    ),
                    Gap(16.w),
                    Expanded(
                      child: MatchCard(matchUser: matchUser),
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
