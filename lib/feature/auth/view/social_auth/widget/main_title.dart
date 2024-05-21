import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/assets.dart';

class MainTitle extends StatelessWidget with ThemeServiceProvider {
  const MainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackgroundArea(),
        buildGradientUnderline(),
        buildTitle(),
        buildMainTitleLogo(),
      ],
    );
  }

  Widget buildBackgroundArea() {
    final double frameWidth = 390.w;
    final double frameHeight = 280.h;

    return Center(
      child: SizedBox(
        width: frameWidth,
        height: frameHeight,
      ),
    );
  }

  Container buildGradientUnderline() {
    final double leftMargin = 45.w;
    final double topMargin = 140.h;
    final double frameWidth = 300.w;

    return Container(
      width: frameWidth,
      padding: EdgeInsets.only(left: leftMargin, top: topMargin),
      child: SvgPicture.asset(AppAsset.lolMuncheolUnderlinePath),
    );
  }

  Widget buildTitle() {
    const String title = "정치질과 입롤에 지칠 때는\n112말고, 롤문철";
    const String subTitle = "3초 가입으로 바로 시작하세요.";

    final double topMargin = 210.h;

    final TextStyle titleStyle =
        textStyleTheme.title2M.copyWith(color: colorTheme.primaryWhite);

    final TextStyle subTitleStyle =
        textStyleTheme.body3R.copyWith(color: colorTheme.primaryWhite);

    return Center(
      child: Container(
        margin: EdgeInsets.only(top: topMargin),
        child: Column(
          children: [
            Text(
              title,
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
            Gap(20.h),
            Text(
              subTitle,
              style: subTitleStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Positioned buildMainTitleLogo() {
    final double frameHeight = 190.h;

    return Positioned(
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: frameHeight,
          child: Image.asset(AppAsset.lolMuncheolLogo),
        ),
      ),
    );
  }
}
