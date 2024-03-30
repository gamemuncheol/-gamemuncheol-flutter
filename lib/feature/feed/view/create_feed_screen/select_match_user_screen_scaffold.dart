import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base_scaffold.dart';
import 'package:gap/gap.dart';

class SelectMatchUserScreenScaffold extends CreateFeedScreenScaffoldBase {
  final Widget header;
  final Widget tabBar;
  final Widget matchUser;

  const SelectMatchUserScreenScaffold({
    super.key,
    required super.appBar,
    required super.nextButton,
    required this.header,
    required this.tabBar,
    required this.matchUser,
  });

  @override
  Widget renderScaffold() {
    const double horizontalPadding = 16;

    return PaddingBuilder()
        .withPadding(horizontal: horizontalPadding)
        .withChild(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(40).withHeight(),
              header,
              const Gap(70).withHeight(),
              tabBar,
              const Gap(20).withHeight(),
              Expanded(
                child: matchUser,
              ),
            ],
          ),
        );
  }
}
