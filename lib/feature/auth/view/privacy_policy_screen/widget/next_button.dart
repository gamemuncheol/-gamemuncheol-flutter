import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/feature/user/model/user.dart';
import 'package:gamemuncheol/feature/user/provider/user_provider.dart';

class PrivacyPolicySheetNextButton extends ConsumerWidget {
  final VoidCallback onTap;

  const PrivacyPolicySheetNextButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BaseState<User?> userState = ref.watch(userNotifierProvider);

    const double buttonHeight = 64;
    const BoxDecoration boxDecoration =
        BoxDecoration(color: AppColor.PRIMARY_BLUE);

    final TextStyle labelStyle = TextStyleBuilder()
        .withColor(AppColor.PRIMARY_WITHE)
        .withFontSize(18)
        .withRegular()
        .build();

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: userState.isLoading ? null : onTap,
        child: ContainerBuilder()
            .setHeigh(buttonHeight)
            .setBoxDecoration(boxDecoration)
            .setChild(
              Center(
                child: userState.when(
                  loading: () {
                    return const CircularProgressIndicator(
                      color: AppColor.PRIMARY_WITHE,
                    );
                  },
                  orElse: () {
                    return Text("다음", style: labelStyle);
                  },
                ),
              ),
            ),
      ),
    );
  }
}
