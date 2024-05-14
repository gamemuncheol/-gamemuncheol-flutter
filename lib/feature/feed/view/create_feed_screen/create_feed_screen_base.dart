import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/presentation/layout/default_layout.dart';

abstract class CreateFeedScreenBaseScaffold extends StatelessWidget {
  CreateFeedScreenBaseScaffold({super.key});

  final double horizontalPadding = 16.w;

  Widget buildStepBar();
  Widget? buildBottomButton();
  Widget buildScaffold(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: [
                  SafeArea(bottom: false, child: buildStepBar()),
                  Expanded(child: buildScaffold(context)),
                ],
              ),
            ),
          ),
          if (buildBottomButton() != null)
            SafeArea(top: false, child: buildBottomButton()!),
        ],
      ),
    );
  }
}
