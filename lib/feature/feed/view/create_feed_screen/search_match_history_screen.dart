// ignore_for_file: constant_identifier_names, must_be_immutable

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/search_match_history_screen_event.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/search_match_history_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/header.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/match_history_card.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/next_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/search_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/app_bar.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/upload_video_screen.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:gamemuncheol/feature/feed/provider/search_match_history_provider.dart';

class SearchMatchHistoryScreen extends HookWidget
    with SearchMatchHistoryScreenEvent {
  SearchMatchHistoryScreen({
    super.key,
  });

  static const PATH = "/search_maatch_history_screen";
  static const ROUTE_NAME = "SearchMatchHistoryScreen";

  MatchHistory matchHistory = MatchHistory(
    gameId: "KR_6862565824",
    gameCreation: "2023-12-22T05:45:17Z",
    gameDuration: 1574,
    gameMode: "CLASSIC",
    matchUsers: [
      MatchUser.fromJson({
        "puuid":
            "R_NPpUpcQnPBBbCLZ538sPAugIs6WdGmgm-g1nTs-1Vt_6_gCqgf2-DvJNNU7VZEMAkpfjVVnAl0pA",
        "nickname": "코팩코팩123 #KR1",
        "championThumbnail":
            "https://ddragon.leagueoflegends.com/cdn/11.1.1/img/champion/Sylas.png",
        "win": false
      }),
      MatchUser.fromJson({
        "puuid":
            "TJkxWqZV39_XNcRALbMTj26xA29lwNG2iMbjPyGLoJKYLCY9C8n8vWMHugTXLUzbl78prN_s-SLVYA",
        "nickname": "북한산개구락지 #KR1",
        "championThumbnail":
            "https://ddragon.leagueoflegends.com/cdn/11.1.1/img/champion/Taliyah.png",
        "win": true
      }),
      MatchUser.fromJson({
        "puuid":
            "TJkxWqZV39_XNcRALbMTj26xA29lwNG2iMbjPyGLoJKYLCY9C8n8vWMHugTXLUzbl78prN_s-SLVYA",
        "nickname": "갤럭시개구리 #KR1",
        "championThumbnail":
            "https://ddragon.leagueoflegends.com/cdn/11.1.1/img/champion/Taliyah.png",
        "win": true
      }),
      MatchUser.fromJson({
        "puuid":
            "TJkxWqZV39_XNcRALbMTj26xA29lwNG2iMbjPyGLoJKYLCY9C8n8vWMHugTXLUzbl78prN_s-SLVYA",
        "nickname": "건지산괴물1 #KR1",
        "championThumbnail":
            "https://ddragon.leagueoflegends.com/cdn/11.1.1/img/champion/Taliyah.png",
        "win": false
      }),
      MatchUser.fromJson({
        "puuid":
            "TJkxWqZV39_XNcRALbMTj26xA29lwNG2iMbjPyGLoJKYLCY9C8n8vWMHugTXLUzbl78prN_s-SLVYA",
        "nickname": "아오우오오 #KR1",
        "championThumbnail":
            "https://ddragon.leagueoflegends.com/cdn/11.1.1/img/champion/Taliyah.png",
        "win": false
      }),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<MatchUser?> mySelf = useState(null);

    return SearchMatchHistoryScreenScaffold(
      appBar: renderAppBar(),
      nextButton: renderNextButton(context, mySelf: mySelf),
      header: renderHeader(),
      searchBar: renderSearchBar(),
      matchHistory: renderMatchHistory(mySelf: mySelf),
    );
  }

  Widget renderAppBar() => const CreateFeedScreenAppBar(currentStep: 1);

  Widget renderNextButton(
    BuildContext context, {
    required ValueNotifier<MatchUser?> mySelf,
  }) {
    final TextStyle labelStyle = TextStyleBuilder()
        .withColor(AppColor.PRIMARY_WITHE)
        .withFontSize(20)
        .build();

    return Consumer(
      builder: (context, ref, child) {
        final Ds<MatchHistory> state =
            ref.read(searchMatchHistoryNotiferProvider);

        final bool canGo = mySelf.value != null;

        final BoxDecoration buttonDecoration = BoxDecoration(
          color: AppColor.PRIMARY_BLUE.withOpacity(canGo ? 1 : 0.5),
        );

        return CreateFeedScreenNextButton(
          onTap: canGo
              ? () => goNextStep(
                    context,
                    matchHistory: matchHistory,
                    mySelf: mySelf.value!,
                  )
              : () {},
          text: "다음",
          textStyle: labelStyle,
          buttonDecoration: buttonDecoration,
        );
      },
    );
  }

  Widget renderHeader() {
    return const CreateFeedScreenHeader(
      title: "전적입력을 위해 게임ID\n를 입력해주세요.",
      description: "롤문철이 명확하게 판단해드려요.",
    );
  }

  Widget renderSearchBar() {
    return const CustomSearchBar();
  }

  Widget renderMatchHistory({
    required ValueNotifier<MatchUser?> mySelf,
  }) {
    const double bottomPadding = 24;
    TextStyle textStyle = TextStyleBuilder()
        .withColor(AppColor.NATURAL_05)
        .withFontSize(14)
        .withRegular()
        .build();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "검색결과",
          style: textStyle,
        ),
        const Gap(20).withHeight(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: bottomPadding),
          itemCount: matchHistory.matchUsers.length,
          itemBuilder: (context, index) {
            final MatchUser matchUser = matchHistory.matchUsers[index];

            return PaddingBuilder()
                .withPadding(bottom: bottomPadding)
                .withChild(
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => selectMySelf(
                          mySelf: mySelf,
                          matchUser: matchUser,
                        ),
                        child: SvgPicture.asset(
                          mySelf.value == matchUser
                              ? AppAsset.CHECKBOX_FILLED_VER_PATH
                              : AppAsset.CHECKBOX_BLANK_VER_PATH,
                        ),
                      ),
                      const Gap(16).withWidth(),
                      Expanded(
                        child: MatchHistoryCard(
                          matchUser: matchUser,
                          gameCreation: matchHistory.gameCreation,
                        ),
                      ),
                    ],
                  ),
                );
          },
        ),
      ],
    );
    // return Consumer(
    //   builder: (context, ref, child) {
    //     final Ds<MatchHistory> state =
    //         ref.watch(searchMatchHistoryNotiferProvider);

    //     return state.onState(
    //       initial: () {
    //         const double space1 = 16;
    //         const double space2 = 20;

    //         const double imageWidth = 358;
    //         const double imageHeight = 212;

    //         return Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const Gap(space1).withHeight(),
    //             SvgPicture.asset(
    //               AssetPaths.MATCH__INFO_TEXT_PATH,
    //             ),
    //             const Gap(space2).withHeight(),
    //             ContainerBuilder()
    //                 .withSize(
    //                   width: imageWidth,
    //                   height: imageHeight,
    //                 )
    //                 .withChild(
    //                   Image.asset(
    //                     AssetPaths.MATCH__INFO_IMAGE_PATH,
    //                   ),
    //                 ),
    //           ],
    //         );
    //       },
    //       loading: (loadingText) => const Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //       error: (error) => Center(
    //         child: Text(error.toString()),
    //       ),
    //       loaded: (matchHistory) => ListView.builder(
    //         itemCount: matchHistory.matchUsers.length,
    //         itemBuilder: (context, index) {
    //           final MatchUser matchUser = matchHistory.matchUsers[index];

    //           return ValueListenableBuilder(
    //             valueListenable: authorNotifier,
    //             builder: (context, author, child) {
    //               return MatchHistoryCard(
    //                 gameCreation: matchHistory.gameCreation,
    //                 matchUser: matchUser,
    //                 selected: author == matchUser,
    //                 selectAuthor: () => selectAuthor(
    //                   authorNotifier: authorNotifier,
    //                   matchUser: matchUser,
    //                 ),
    //               );
    //             },
    //           );
    //         },
    //       ),
    //     );
    //   },
    // );
  }
}
