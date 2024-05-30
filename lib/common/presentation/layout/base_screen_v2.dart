import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/component/loading_indicator.dart';
import 'package:gamemuncheol/common/service/dialog_service.dart';
import 'package:gamemuncheol/common/service/snack_bar_service.dart';
import 'package:gamemuncheol/common/util/system_util.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseScreenV2 extends StatefulHookConsumerWidget {
  const BaseScreenV2({super.key});

  @override
  ConsumerState<BaseScreenV2> createState();
}

abstract class BaseScreenV2State<T extends BaseScreenV2>
    extends ConsumerState<T> with SystemUtil, DialogService, SnackBarService {
  // 테마 바로가기
  final colorTheme = ThemeUtil.colorTheme;

  // 테마 바로가기
  final textStyleTheme = ThemeUtil.textStyleTheme;

  // 키보드 패딩
  bool get resizeToAvoidBottomInset => false;

  // 바디
  Widget buildBody();

  // 앱바
  PreferredSizeWidget? buildAppBar() => null;

  // 배경
  Color get backgroundColor => colorTheme.background;
}

mixin DefaultLayout<T extends BaseScreenV2> on BaseScreenV2State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }
}

mixin BlurLayout<T extends BaseScreenV2> on BaseScreenV2State<T> {
  ProviderListenable get provider;

  @override
  Widget build(BuildContext context) {
    const double sigmaX = 5.0;
    const double sigmaY = 5.0;

    final TextStyle loadingTextStyle = textStyleTheme.baseTextStyle;

    return Material(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            appBar: buildAppBar(),
            body: buildBody(),
          ),
          Consumer(builder: (context, ref, child) {
            final bState = (ref.watch(provider) as StateMapper);

            return Center(
              child: bState.whenBState(
                orElse: () => const SizedBox(),
                loadingWithMessage: (message) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: sigmaX,
                      sigmaY: sigmaY,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LoadingIndicator(),
                        Visibility(
                          visible: message.isNotEmpty,
                          child: Column(
                            children: [
                              Gap(18.h),
                              Text(
                                message,
                                style: loadingTextStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
