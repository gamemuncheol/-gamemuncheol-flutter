import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/presentation/widget/custom_text_form_filed.dart';
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

  final int maxTitleLength = 40;
  final int maxTitleLine = 1;

  final int maxDescriptionLength = 1200;
  final int maxDescriptionLine = 300;

  final double frameHeight = 200;

  @override
  Widget build(BuildContext context) {
    final GlobalKey titleFieldKey = GlobalKey();
    final GlobalKey contentFieldKey = GlobalKey();

    return Form(
      key: formKey,
      child: Column(
        children: [
          buildFormIcon(iconPath: AppAsset.title, label: "제목"),
          const Gap(12).setHeight(),
          buildTitleField(titleFieldKey: titleFieldKey),
          const Gap(48).setHeight(),
          buildFormIcon(iconPath: AppAsset.contents, label: "내용"),
          const Gap(32).setHeight(),
          buildContentField(contentFieldKey: contentFieldKey),
        ],
      ),
    );
  }

  Widget buildTitleField({required GlobalKey titleFieldKey}) {
    return Builder(
      builder: (context) {
        final TextStyle titleStyle = context.textStyleTheme.body4R
            .copyWith(color: context.colorTheme.natural06);

        return CustomTextFormField(
          fieldKey: titleFieldKey,
          textEditingController: titleController,
          isUnderLineTextFormField: true,
          maxLength: maxTitleLength,
          maxLines: maxTitleLine,
          textStyle: titleStyle,
          counterBuilder: buildCounter,
        );
      },
    );
  }

  Widget buildContentField({required GlobalKey contentFieldKey}) {
    return Builder(
      builder: (context) {
        final TextStyle descriptionStyle = context.textStyleTheme.body4R
            .copyWith(color: context.colorTheme.natural06);

        return SizedBoxBuilder()
            .setHeigh(
              frameHeight,
            )
            .setChild(
              CustomTextFormField(
                fieldKey: contentFieldKey,
                textEditingController: descriptionController,
                isUnderLineTextFormField: false,
                maxLength: maxDescriptionLength,
                maxLines: maxDescriptionLine,
                textStyle: descriptionStyle,
              ),
            );
      },
    );
  }

  Widget buildFormIcon({required String iconPath, required String label}) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        const Gap(12).setWidth(),
        Text(label),
      ],
    );
  }

  Widget buildCounter(
    BuildContext context, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  }) {
    const double topPadding = 12;

    final TextStyle counterStyle = context.textStyleTheme.body5R;
    final TextStyle currentStyle =
        counterStyle.copyWith(color: context.colorTheme.primaryBlue);
    final TextStyle maxLengthStyle =
        counterStyle.copyWith(color: context.colorTheme.natural03);

    return PaddingBuilder()
        .setPadding(
          top: topPadding,
        )
        .setChild(
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: currentLength.toString(), style: currentStyle),
                TextSpan(text: "/$maxLength", style: maxLengthStyle),
              ],
            ),
          ),
        );
  }
}
