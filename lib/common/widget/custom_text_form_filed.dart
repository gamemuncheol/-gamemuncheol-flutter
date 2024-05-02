import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';

typedef CounterBuilder = Widget? Function(
  BuildContext, {
  required int currentLength,
  required bool isFocused,
  required int? maxLength,
})?;

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool isUnderLineFormField;
  final TextStyle? textStyle;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;
  final CounterBuilder? counterBuilder;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.textEditingController,
    required this.isUnderLineFormField,
    this.textStyle,
    this.hintText,
    this.maxLength,
    this.maxLines,
    this.counterBuilder,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultErrorStyle = context.textStyleTheme.body5R
        .copyWith(color: context.colorTheme.errorRed);

    final TextStyle defaultHintStyle = context.textStyleTheme.body4M
        .copyWith(color: context.colorTheme.natural03);

    final UnderlineInputBorder underlineBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: context.colorTheme.primaryBlue));

    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: context.colorTheme.primaryBlue));

    return TextFormField(
      controller: textEditingController,
      style: textStyle,
      maxLines: maxLines,
      maxLength: maxLength,
      cursorColor: context.colorTheme.primaryBlue,
      buildCounter: counterBuilder,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: defaultHintStyle,
        errorStyle: defaultErrorStyle,
        counterText: counterBuilder == null ? "" : null,
        enabledBorder: isUnderLineFormField
            ? underlineBorder.copyWith(
                borderSide: BorderSide(color: context.colorTheme.natural02))
            : outlineInputBorder.copyWith(
                borderSide: BorderSide(color: context.colorTheme.natural02)),
        focusedBorder:
            isUnderLineFormField ? underlineBorder : outlineInputBorder,
        focusedErrorBorder: isUnderLineFormField
            ? underlineBorder.copyWith(
                borderSide: BorderSide(color: context.colorTheme.errorRed))
            : outlineInputBorder.copyWith(
                borderSide: BorderSide(color: context.colorTheme.errorRed)),
        errorBorder: isUnderLineFormField
            ? underlineBorder.copyWith(
                borderSide: BorderSide(color: context.colorTheme.errorRed))
            : outlineInputBorder.copyWith(
                borderSide: BorderSide(color: context.colorTheme.errorRed)),
      ),
    );
  }
}
