import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/presentation/layout/bottom_button_expanded_layout.dart';
import 'package:gap/gap.dart';

class EnterFeedFormScreenLayout extends BottomButtonExpandedLayout {
  final Widget bottomButton;

  final Widget header;
  final Widget thumbImage;
  final Widget form;
  final Widget tags;

  const EnterFeedFormScreenLayout({
    super.key,
    required this.bottomButton,
    required this.header,
    required this.thumbImage,
    required this.form,
    required this.tags,
  });

  @override
  double get horizontalPadding => 0;

  @override
  Widget buildBottomButton() => bottomButton;

  @override
  Widget buildBottomButtonExpandedLayout(BuildContext context) {
    final double horizontalPadding = 16.h;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
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
                      Gap(40.h),
                      Row(
                        children: [
                          header,
                        ],
                      ),
                      Gap(10.h),
                      Center(
                        child: thumbImage,
                      ),
                      Gap(60.h),
                      form,
                      Gap(60.h),
                      tags,
                      Gap(110.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
