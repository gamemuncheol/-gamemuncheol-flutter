import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/event/select_match_user_screen_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/match_card.dart';
import 'package:gap/gap.dart';

class StakeHolders extends ConsumerWidget with SelectStakeHolderScreenEvent {
  final bool inMyTeam;
  const StakeHolders({super.key, required this.inMyTeam});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double verticalPadding = 12;

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

          return PaddingBuilder()
              .setPadding(vertical: verticalPadding)
              .setChild(
                GestureDetector(
                  onTap: () => selected
                      ? exceptStakeHolder(ref, stakeHolder: matchUser)
                      : selectStakeHolder(ref, stakeHolder: matchUser),
                  child: Container(
                    color: context.colorTheme.background,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          selected
                              ? AppAsset.CHECKBOX_FILLED_VER_PATH
                              : AppAsset.CHECKBOX_BLANK_VER_PATH,
                        ),
                        const Gap(16).setWidth(),
                        Expanded(child: MatchCard(matchUser: matchUser)),
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
