import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';

import 'package:gamemuncheol/common/presentation/widget/custom_text_form_filed.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gamemuncheol/common/util/form_validator.dart';
import 'package:gap/gap.dart';

class FeedForm extends StatelessWidget with ThemeServiceProvider {
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
  final int maxTitleLines = 1;

  final int maxDescriptionLength = 1200;
  final int maxDescriptionLines = 300;

  @override
  Widget build(BuildContext context) {
    final GlobalKey titleFieldKey = GlobalKey();
    final GlobalKey descriptionFieldKey = GlobalKey();

    return Form(
      key: formKey,
      child: Column(
        children: [
          buildFormIcon(
            iconPath: AppAsset.title,
            label: "제목",
          ),
          Gap(12.h),
          buildTitleField(
            titleFieldKey: titleFieldKey,
          ),
          Gap(48.h),
          buildFormIcon(
            iconPath: AppAsset.contents,
            label: "내용",
          ),
          Gap(32.h),
          buildDescriptionField(
            descriptionFieldKey: descriptionFieldKey,
          ),
        ],
      ),
    );
  }

  Widget buildTitleField({required GlobalKey titleFieldKey}) {
    final TextStyle titleStyle =
        textStyleTheme.body4R.copyWith(color: colorTheme.natural06);

    return CustomTextFormField(
      fieldKey: titleFieldKey,
      validator: (value) {
        final bool isValid = FormValidator.lengthValidator(value, min: 3);
        return isValid ? null : "제목을 최소 세 글자 이상 입력해 주세요.";
      },
      textEditingController: titleController,
      isUnderLineTextFormField: true,
      maxLength: maxTitleLength,
      maxLines: maxTitleLines,
      textStyle: titleStyle,
      counterBuilder: buildCounter,
    );
  }

  Widget buildDescriptionField({required GlobalKey descriptionFieldKey}) {
    final double fieldHeight = 200.h;

    final TextStyle descriptionStyle =
        textStyleTheme.body4R.copyWith(color: colorTheme.natural06);

    return SizedBox(
      height: fieldHeight,
      child: CustomTextFormField(
        fieldKey: descriptionFieldKey,
        validator: (value) {
          final bool isValid = FormValidator.lengthValidator(value, min: 3);
          return isValid ? null : "본문을 최소 세 글자 이상 입력해 주세요.";
        },
        textEditingController: descriptionController,
        isUnderLineTextFormField: false,
        maxLength: maxDescriptionLength,
        maxLines: maxDescriptionLines,
        textStyle: descriptionStyle,
      ),
    );
  }

  Widget buildFormIcon({required String iconPath, required String label}) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        Gap(12.w),
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
    final double topPadding = 12.h;

    final currentStyle =
        textStyleTheme.body5R.copyWith(color: colorTheme.primaryBlue);
    final maxLengthStyle =
        textStyleTheme.body5R.copyWith(color: colorTheme.natural03);

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: currentLength.toString(),
              style: currentStyle,
            ),
            TextSpan(
              text: "/$maxLength",
              style: maxLengthStyle,
            ),
          ],
        ),
      ),
    );
  }
}
