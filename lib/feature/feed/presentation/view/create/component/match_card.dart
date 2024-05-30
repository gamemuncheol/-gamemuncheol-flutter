import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/time_formatter.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';

class MatchCard extends ConsumerWidget with ThemeProvider {
  final MatchUser matchUser;
  final String? gameCreation;

  const MatchCard({
    super.key,
    required this.matchUser,
    this.gameCreation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        buildCharacterImage(),
        Gap(16.w),
        Expanded(
          child: buildMatchInfo(),
        ),
        if (gameCreation != null) Gap(16.w),
        if (gameCreation != null) buildMatchResult(),
      ],
    );
  }

  Widget buildCharacterImage() {
    double thumbNailRadius = 24.w;

    return SizedBox(
      width: thumbNailRadius * 2,
      height: thumbNailRadius * 2,
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: matchUser.championThumbnail,
        ),
      ),
    );
  }

  Widget buildMatchInfo() {
    const int maxNicknameLength = 8;
    final String nickname = matchUser.nickname.split("#").first.trim();
    final bool exceed = nickname.length > maxNicknameLength;

    final String displayedNickName =
        exceed ? '${nickname.substring(0, maxNicknameLength)}...' : nickname;

    final String displayedChampion = matchUser.championName;

    final TextStyle creationStyle =
        textStyleTheme.cap1.copyWith(color: colorTheme.natural05);

    final TextStyle nicknameStyle = textStyleTheme.body5R;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (gameCreation != null)
          Text(
            TimeFormatter.formatDateTime(gameCreation!),
            style: creationStyle,
          ),
        if (gameCreation != null) Gap(4.h),
        Row(
          children: [
            Text(
              displayedNickName,
              style: nicknameStyle,
            ),
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

  Widget buildMatchResult() {
    final bool isWinner = matchUser.win;

    final boxDecoration = BoxDecoration(
      color: isWinner ? colorTheme.primaryBlue : colorTheme.background,
      borderRadius: BorderRadius.circular(64),
      border: Border.all(
          color: isWinner ? colorTheme.primaryBlue : colorTheme.primaryGreen),
    );

    final String result = isWinner ? "승리" : "패배";
    final resultStyle = textStyleTheme.body5M.copyWith(
        color: isWinner ? colorTheme.onPrimaryBlue : colorTheme.primaryGreen);

    const double frameWidth = 58;
    const double frameHeight = 28;

    return Container(
      width: frameWidth,
      height: frameHeight,
      decoration: boxDecoration,
      child: Center(
        child: Text(
          result,
          style: resultStyle,
        ),
      ),
    );
  }
}
