import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/widget/custom_text_form_filed.dart';
import 'package:gap/gap.dart';

class FeedForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const FeedForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    const int maxTitleLength = 40;
    const int maxDescriptionLength = 1200;
    const int maxDescriptionLines = 300;

    const double frameHeight = 200;

    final TextStyle counterStyle = context.textStyleTheme.body5R;
    final TextStyle titleStyle = context.textStyleTheme.body4R
        .copyWith(color: context.colorTheme.natural06);
    final TextStyle descriptionStyle = titleStyle;

    return Form(
      child: Column(
        children: [
          renderFormIcon(
            iconPath: AppAsset.FORM_TITLE_ICON,
            label: "제목",
          ),
          const Gap(12).setHeight(),
          CustomTextFormField(
            textEditingController: titleController,
            isUnderLineFormField: true,
            maxLength: maxTitleLength,
            textStyle: titleStyle,
            counterBuilder: (
              context, {
              required currentLength,
              required isFocused,
              required maxLength,
            }) {
              return PaddingBuilder()
                  .setPadding(
                    top: 12,
                  )
                  .setChild(
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: currentLength.toString(),
                            style: counterStyle.copyWith(
                              color: context.colorTheme.primaryBlue,
                            ),
                          ),
                          TextSpan(
                            text: "/$maxLength",
                            style: counterStyle.copyWith(
                              color: context.colorTheme.natural03,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
            },
          ),
          const Gap(48).setHeight(),
          renderFormIcon(
            iconPath: AppAsset.FORM_DESCRIPTION_ICON,
            label: "내용",
          ),
          const Gap(32).setHeight(),
          SizedBoxBuilder()
              .setHeigh(
                frameHeight,
              )
              .withChild(
                CustomTextFormField(
                  textEditingController: descriptionController,
                  isUnderLineFormField: false,
                  maxLength: maxDescriptionLength,
                  maxLines: maxDescriptionLines,
                  textStyle: descriptionStyle,
                ),
              ),
        ],
      ),
    );
  }

  Widget renderFormIcon({
    required String iconPath,
    required String label,
  }) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        const Gap(12).setWidth(),
        Text(label),
      ],
    );
  }
}
