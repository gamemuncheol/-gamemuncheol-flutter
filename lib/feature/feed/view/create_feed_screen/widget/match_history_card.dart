import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
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
        const Gap(16).withWidth(),
        Expanded(child: renderMatchInfo()),
        if (gameCreation != null) const Gap(16).withWidth(),
        if (gameCreation != null) renderMatchResult(),
      ],
    );
  }

  Widget renderThumnail() {
    const double thumbNailRadius = 24;

    return ContainerBuilder()
        .withSize(
          width: thumbNailRadius * 2,
          height: thumbNailRadius * 2,
        )
        .withChild(
          ClipOval(
            child: CachedNetworkImage(imageUrl: matchUser.championThumbnail),
          ),
        );
  }

  Widget renderMatchInfo() {
    const double space1 = 4;

    const int maxLength = 6;
    final String nickname = matchUser.nickname.split("#").first.trim();
    final bool exceed = nickname.length > maxLength;
    final String displayedNickName =
        exceed ? '${nickname.substring(0, maxLength)}...' : nickname;

    final String displayedChampion =
        matchUser.championThumbnail.split("/").last.split(".").first;

    final TextStyle creationStyle = TextStyleBuilder()
        .withColor(AppColor.NATURAL_05)
        .withFontSize(13)
        .withRegular()
        .build();

    final TextStyle nicknameStyle =
        TextStyleBuilder().withFontSize(14).withRegular().build();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (gameCreation != null)
          Text(
            TimeFormatter.formatDateTime(gameCreation!),
            style: creationStyle,
          ),
        if (gameCreation != null) const Gap(space1).withHeight(),
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

  Widget renderMatchResult() {
    final bool isWinner = matchUser.win;

    final BoxDecoration boxDecoration = BoxDecoration(
        color:
            isWinner ? AppColor.PRIMARY_BLUE : AppColor.PRIMARY_WITHE,
        borderRadius: BorderRadius.circular(64),
        border: Border.all(
          color: isWinner
              ? AppColor.PRIMARY_BLUE
              : AppColor.PRIMARY_GREEN,
        ));

    final TextStyle resultStyle = TextStyleBuilder()
        .withColor(
          isWinner ? AppColor.PRIMARY_WITHE : AppColor.PRIMARY_GREEN,
        )
        .withFontSize(14)
        .withRegular()
        .build();

    const double frameWidth = 58;
    const double frameHeight = 28;
    return ContainerBuilder()
        .withSize(
          width: frameWidth,
          height: frameHeight,
        )
        .withBoxDecoration(boxDecoration)
        .withChild(
          Center(
            child: Text(
              isWinner ? "승리" : "패배",
              style: resultStyle,
            ),
          ),
        );
  }
}
