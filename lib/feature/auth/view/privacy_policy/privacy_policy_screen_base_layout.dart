import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class PrivacyPolicyScreenBaseLayout extends StatelessWidget {
  const PrivacyPolicyScreenBaseLayout({super.key});

  Widget buildLayout();
  Widget buildNextButton();

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding =
        EdgeInsets.only(left: 36.w, right: 36.w, top: 30.h);

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: padding,
            child: buildLayout(),
          ),
        ),
        SafeArea(
          top: false,
          child: buildNextButton(),
        ),
      ],
    );
  }
}
