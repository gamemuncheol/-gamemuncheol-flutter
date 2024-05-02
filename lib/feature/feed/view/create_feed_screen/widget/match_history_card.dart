import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/util/time_formatter.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';

class MatchHistoryCard extends ConsumerWidget {
  final MatchUser matchUser;
  final String? gameCreation;

  const MatchHistoryCard({
    super.key,
    required this.matchUser,
    this.gameCreation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        renderThumnail(),
        const Gap(16).setWidth(),
        Expanded(child: renderMatchInfo(context)),
        if (gameCreation != null) const Gap(16).setWidth(),
        if (gameCreation != null) renderMatchResult(context),
      ],
    );
  }

  Widget renderThumnail() {
    const double thumbNailRadius = 24;

    return SizedBoxBuilder()
        .withSize(width: thumbNailRadius * 2, height: thumbNailRadius * 2)
        .withChild(
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: matchUser.championThumbnail,
              fit: BoxFit.cover,
            ),
          ),
        );
  }

  Widget renderMatchInfo(BuildContext context) {
    const int maxNicknameLength = 6;

    final String fullNickname = matchUser.nickname.split("#").first.trim();
    final bool exceed = fullNickname.length > maxNicknameLength;

    final String displayedNickName = exceed
        ? '${fullNickname.substring(0, maxNicknameLength)}...'
        : fullNickname;

    final String displayedChampion =
        matchUser.championThumbnail.split("/").last.split(".").first;

    final TextStyle creationStyle = context.textStyleTheme.cap1
        .copyWith(color: context.colorTheme.natural05);

    final TextStyle nicknameStyle = context.textStyleTheme.body5R;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (gameCreation != null)
          Text(
            TimeFormatter.formatDateTime(gameCreation!),
            style: creationStyle,
          ),
        if (gameCreation != null) const Gap(4).setHeight(),
        Row(
          children: [
            Text(displayedNickName, style: nicknameStyle),
            const Text(" / "),
            Expanded(
              child: Text(
                displayedChampion,
                style: nicknameStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget renderMatchResult(BuildContext context) {
    final bool isWinner = matchUser.win;

    final BoxDecoration boxDecoration = BoxDecoration(
      color: isWinner
          ? context.colorTheme.primaryBlue
          : context.colorTheme.background,
      borderRadius: BorderRadius.circular(64),
      border: Border.all(
          color: isWinner
              ? context.colorTheme.primaryBlue
              : context.colorTheme.primaryGreen),
    );

    final TextStyle resultStyle = context.textStyleTheme.body5M.copyWith(
      color: isWinner
          ? context.colorTheme.onPrimaryBlue
          : context.colorTheme.primaryGreen,
    );

    const double frameWidth = 58;
    const double frameHeight = 28;
    return ContainerBuilder()
        .withSize(width: frameWidth, height: frameHeight)
        .setBoxDecoration(boxDecoration)
        .setChild(
          Center(
            child: Text(
              isWinner ? "승리" : "패배",
              style: resultStyle,
            ),
          ),
        );
  }
}
