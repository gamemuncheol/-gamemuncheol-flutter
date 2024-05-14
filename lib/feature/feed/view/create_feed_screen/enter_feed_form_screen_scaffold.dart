import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';

class EnterFeedFormScreenScaffold extends CreateFeedScreenBaseScaffold {
  final Widget stepBar;
  final Widget bottomButton;

  final Widget header;
  final Widget thumbImage;
  final Widget form;
  final Widget tags;

  EnterFeedFormScreenScaffold({
    super.key,
    required this.stepBar,
    required this.bottomButton,
    required this.header,
    required this.thumbImage,
    required this.form,
    required this.tags,
  });

  @override
  double get horizontalPadding => 0;

  @override
  Widget buildStepBar() => stepBar;

  @override
  Widget? buildBottomButton() => null;

  @override
  Widget buildScaffold(BuildContext context) {
    final double horizontalPadding = 32.w;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding)
                      .copyWith(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          header,
                        ],
                      ),
                      const Gap(10).setHeight(),
                      Center(
                        child: thumbImage,
                      ),
                      const Gap(60).setHeight(),
                      form,
                      const Gap(60).setHeight(),
                      tags,
                      const Gap(110).setHeight(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomButton,
          ),
        ],
      ),
    );
  }
}
