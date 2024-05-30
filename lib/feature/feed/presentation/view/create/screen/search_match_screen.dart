// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/common/presentation/component/loading_indicator.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/model/match_user.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/state/match_state.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/search_match_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/search_match_screen_layout.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_app_bar.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_header.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/match_card.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/match_search_bar.dart';

class SearchMatchScreen extends BaseScreenV2 {
  const SearchMatchScreen({super.key});

  static const PATH = "/$NAME";
  static const NAME = "SEARCH_MATCH_SCREEN";

  @override
  BaseScreenV2State<SearchMatchScreen> createState() =>
      _SearchMatchScreenV2State();
}

class _SearchMatchScreenV2State extends BaseScreenV2State<SearchMatchScreen>
    with DefaultLayout, SearchMatchScreenState {
  @override
  PreferredSizeWidget? buildAppBar() {
    return CreateFeedScreenAppBar.step1(
      onLeadingTap: onLeadingTap,
    ).toAppBar();
  }

  @override
  Widget buildBody() {
    return SearchMatchScreenLayout(
      bottomButton: _buildNextButton(),
      header: _buildHeader(),
      searchBar: _buildSearchBar(),
      searchResult: _buildSearchResult(),
    );
  }

  Widget _buildNextButton() {
    return Consumer(
      builder: (context, ref, child) {
        final StateMapper<MatchState> state = ref.watch(matchNotiferProvider);
        final bool able = state.isPState && state.pState.isMatchSelected;

        return able
            ? CreateFeedScreenNextButton(onTap: onNextButtonTap)
            : CreateFeedScreenNextButton.disAble();
      },
    );
  }

  Widget _buildHeader() {
    const String title = "전적입력을 위해 게임ID\n를 입력해주세요.";
    const String description = "롤문철이 명확하게 판단해드려요.";

    return const CreateFeedScreenHeader(
      title: title,
      description: description,
    );
  }

  Widget _buildSearchBar() {
    return MatchSearchBar(
      search: search,
    );
  }

  Widget _buildSearchResult() {
    const title = "검색결과";
    final titleStyle = textStyleTheme.body5R;

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final double bottomPadding = 24.h;
        final StateMapper<MatchState> state = ref.watch(matchNotiferProvider);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            Gap(20.h),
            Expanded(
              child: state.whenBState(
                initial: () => const SizedBox(),
                loading: () => const Center(
                  child: LoadingIndicator(),
                ),
                error: (message) => Center(
                  child: Text(
                    message,
                  ),
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
                      final bool isMySelf = matchState.isMatchSelected &&
                          matchUser == matchState.myself;

                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: bottomPadding,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            selectMySelf(myself: matchUser);
                          },
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
              ),
            ),
          ],
        );
      },
    );
  }
}
