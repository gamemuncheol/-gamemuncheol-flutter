import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/common/widget/app_text.dart';

class PrivacyPolicyDocs extends StatelessWidget {
  const PrivacyPolicyDocs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.PRIMARY_WITHE,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 32,
            ).useScreenUtil(),
            child: PageView(
              children: const [
                _AcceptTermsPage(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: renderNextButton(),
          )
        ],
      ),
    ).useScreenUtil(
      height: 578,
    );
  }

  Widget renderNextButton() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 34,
      ).useScreenUtil(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.PRIMARY_BLUE,
        ),
        child: const Center(
          child: AppText(
            "다음",
            color: AppColors.PRIMARY_WITHE,
            size: 16,
            weight: FontWeight.w500,
          ),
        ),
      ).useScreenUtil(
        height: 64,
      ),
    );
  }
}

class _AcceptTermsPage extends StatefulWidget {
  const _AcceptTermsPage();

  @override
  State<_AcceptTermsPage> createState() => _AcceptTermsPageState();
}

class _AcceptTermsPageState extends State<_AcceptTermsPage> {
  final ValueNotifier<bool> isAcceptedAllNotifier = ValueNotifier<bool>(
    false,
  );

  void acceptAll() {
    isAcceptedAllNotifier.value = !isAcceptedAllNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        renderHeader(),
        renderAcceptAllTerm(),
        renderDivider(),
        renderSingleTerm(
          text: "[필수] 만 14세 이상입니다.",
        ),
        renderSingleTerm(
          text: "[필수] 만 서비스 이용약관 동의",
        ),
        renderSingleTerm(
          text: "[필수] 개인정보 처리방침 동의",
        ),
        renderSingleTerm(
          text: "[필수] 마케팅 수신 동의",
        ),
      ],
    );
  }

  Widget renderHeader() {
    return const _DocsHeader(
      title: "약관에 동의해주세요",
      description: "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.",
    );
  }

  Widget renderAcceptAllTerm() {
    return SizedBox(
      height: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SingleTerm(
            text: "모두 동의",
            isBoldText: true,
            isAcceptedAllNotifier: isAcceptedAllNotifier,
            acceptAll: acceptAll,
          ),
          const AppText(
            "서비스 이용을 위해 아래 약관에 모두 동의합니다.",
            color: AppColors.FONT_GREY,
            size: 14,
            weight: FontWeight.w300,
          ),
        ],
      ),
    ).useScreenUtil();
  }

  Widget renderDivider() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        right: 24,
        bottom: 24,
      ).useScreenUtil(),
      child: const Divider(
        color: AppColors.WHITE100,
        height: 3,
      ),
    );
  }

  Widget renderSingleTerm({
    required String text,
  }) {
    return SizedBox(
      height: 44,
      child: Center(
        child: _SingleTerm(
          text: text,
          isAcceptedAllNotifier: isAcceptedAllNotifier,
        ),
      ),
    );
  }
}

class _DocsHeader extends StatelessWidget {
  final String title;

  final String description;

  const _DocsHeader({
    required this.title,
    required this.description,
  });

  void cancle(BuildContext context) {
    context.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
                "약관에 동의해주세요",
                color: AppColors.FONT_BLACK,
                size: 20,
                weight: FontWeight.w700,
              ),
              GestureDetector(
                onTap: () => cancle(
                  context,
                ),
                child: Container(
                  color: AppColors.PRIMARY_WITHE,
                  child: SvgPicture.asset(
                    AssetPaths.CANCLE_ICON_PATH,
                  ),
                ),
              ),
            ],
          ),
          const AppText(
            "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.",
            color: AppColors.FONT_GREY,
            size: 16,
            weight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}

class _SingleTerm extends StatefulWidget {
  final String text;

  final bool isBoldText;

  final ValueNotifier<bool> isAcceptedAllNotifier;

  final Function()? acceptAll;

  const _SingleTerm({
    required this.text,
    this.isBoldText = false,
    required this.isAcceptedAllNotifier,
    this.acceptAll,
  });

  @override
  State<_SingleTerm> createState() => _SingleTermState();
}

class _SingleTermState extends State<_SingleTerm> {
  @override
  void initState() {
    super.initState();
    isChecked = widget.isAcceptedAllNotifier.value;
    widget.isAcceptedAllNotifier.addListener(
      updateChecked,
    );
  }

  void updateChecked() {
    setState(() {
      isChecked = widget.isAcceptedAllNotifier.value;
    });
  }

  void accept() {
    setState(() {
      isChecked = !isChecked;
    });

    if (widget.acceptAll != null) {
      widget.acceptAll!();
    }
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => accept(),
              child: Container(
                color: AppColors.PRIMARY_WITHE,
                child: SvgPicture.asset(
                  isChecked
                      ? AssetPaths.CHECKBOX_FILLED_VER_PATH
                      : AssetPaths.CHECKBOX_BLANK_VER_PATH,
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ).useScreenUtil(),
            AppText(
              widget.text,
              color: AppColors.FONT_BLACK,
              size: widget.isBoldText ? 18 : 16,
              weight: widget.isBoldText ? FontWeight.w700 : FontWeight.w300,
            ),
          ],
        ),
        SvgPicture.asset(
          AssetPaths.ARROW_RIGHT_PATH,
        ),
      ],
    );
  }
}

