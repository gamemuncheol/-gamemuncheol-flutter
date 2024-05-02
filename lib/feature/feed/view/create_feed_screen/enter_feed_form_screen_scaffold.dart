import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';
import 'package:gap/gap.dart';

class EnterFeedFormScreenScaffold extends CreateFeedScreenBase {
  final Widget header;
  final Widget thumbnail;
  final Widget form;
  final Widget images;
  final Widget tags;

  const EnterFeedFormScreenScaffold({
    super.key,
    required super.stepBar,
    required super.bottomButton,
    required this.header,
    required this.thumbnail,
    required this.form,
    required this.images,
    required this.tags,
  });

  @override
  Widget renderScaffold() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(30).setHeight(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              header,
            ],
          ),
          const Gap(10).setHeight(),
          thumbnail,
          const Gap(58).setHeight(),
          form,
          images,
          tags,
          const Gap(78).setHeight(),
        ],
      ),
    );
  }
}
