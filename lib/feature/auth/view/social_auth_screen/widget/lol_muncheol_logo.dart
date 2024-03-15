import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';

class LolMuncheolLogo extends StatelessWidget {
  const LolMuncheolLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        renderStackBaseFrame(),
        renderGradientUnderline(),
        renderWelcomeText(),
        renderLolMunCheol(),
      ],
    );
  }

  Widget renderStackBaseFrame() {
    const double frameWidth = 390;
    const double frameHeight = 280;

    return Center(
      child: SizedBoxBuilder()
          .withSize(
            width: frameWidth,
            height: frameHeight,
          )
          .build(),
    );
  }

  Container renderGradientUnderline() {
    const double leftMargin = 45;
    const double topMargin = 142;
    const double frameWidth = 300;

    return ContainerBuilder()
        .withMargin(
          left: leftMargin,
          top: topMargin,
        )
        .withSize(
          width: frameWidth,
        )
        .withChild(
          SvgPicture.asset(
            fit: BoxFit.fitWidth,
            AssetPaths.LOL_MUNCHEOL_UNDERLINE_PATH,
          ),
        );
  }

  Widget renderWelcomeText() {
    const double topMargin = 210;
    const double space1 = 20;

    final TextStyle propagandaStyle = TextStyleBuilder()
        .withColor(
          ColorGuidance.PRIMARY_WITHE,
        )
        .withFontSize(
          24,
        )
        .withMedium()
        .build();

    final TextStyle propagandaStyle2 = TextStyleBuilder()
        .withColor(
          ColorGuidance.PRIMARY_WITHE,
        )
        .withFontSize(
          18,
        )
        .withRegular()
        .build();

    return Center(
      child: ContainerBuilder()
          .withMargin(
            top: topMargin,
          )
          .withChild(
            Column(
              children: [
                Text(
                  "정치질과 입롤에 지칠 때는\n112말고, 롤문철",
                  style: propagandaStyle,
                  textAlign: TextAlign.center,
                ),
                const Gap(
                  space1,
                ).withHeight(),
                Text(
                  "3초 가입으로 바로 시작하세요.",
                  style: propagandaStyle2,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
    );
  }

  Positioned renderLolMunCheol() {
    const double frameHeight = 191;

    return Positioned(
      child: Align(
        alignment: Alignment.center,
        child: SizedBoxBuilder()
            .withSize(
              height: frameHeight,
            )
            .withChild(
              Image.asset(
                AssetPaths.LOL_MUNCHEOL_PATH,
              ),
            ),
      ),
    );
  }
}
