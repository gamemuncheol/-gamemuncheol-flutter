import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/widget/header.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/widget/privacy_policy_accept_list_sheet_scaffold.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/widget/single_term.dart';

class PrivacyPolicyAcceptListSheet extends ConsumerWidget {
  final Map<String, bool> terms;

  const PrivacyPolicyAcceptListSheet({
    super.key,
    required this.terms,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrivacyPolicyAcceptListSheetScaffold(
      sheetHeader: renderSheetHeader(),
      accpetAllButton: renderAccpetAllButton(),
      divider1: renderDivider(),
      singleTermList: renderSingleTermList(),
    );
  }

  Widget renderSheetHeader() {
    return const DocsHeader(
      title: "약관에 동의해주세요",
      description: "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.",
    );
  }

  Widget renderAccpetAllButton() {
    return SingleTerm.acceptAll(
      description: "서비스 이용을 위해 아래 약관에 모두 동의합니다.",
    );
  }

  Widget renderDivider() {
    const double topPadding = 21;
    const double bottomPadding = 25;
    const double dividerWidth = 1;
    const double dividerHeight = 328;

    BoxDecoration dividerDecoration = const BoxDecoration(
      color: ColorGuidance.WHITE100,
    );

    return PaddingBuilder()
        .withPadding(
          top: topPadding,
          bottom: bottomPadding,
        )
        .withChild(
          ContainerBuilder()
              .withSize(
                height: dividerWidth,
                width: dividerHeight,
              )
              .withBoxDecoration(
                dividerDecoration,
              )
              .build(),
        );
  }

  Widget renderSingleTermList() {
    const double verticalPadding = 7;

    return Column(
      children: List.generate(
        terms.length,
        (index) => PaddingBuilder()
            .withPadding(
              top: verticalPadding,
              bottom: verticalPadding,
            )
            .withChild(
              // 필수 항목의 경우 true, 선택 항목은 false
              terms.values.toList()[index]
                  ? SingleTerm.singleWithNeccesary(
                      description: terms.keys.toList()[index],
                    )
                  : SingleTerm.singleWithUnnecessary(
                      description: terms.keys.toList()[index],
                    ),
            ),
      ),
    );
  }
}
