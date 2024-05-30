import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/util/theme_util.dart';

typedef CounterBuilder = Widget? Function(
  BuildContext context, {
  required bool isFocused,
  required int? maxLength,
  required int currentLength,
})?;

class CustomTextFormField extends StatelessWidget with ThemeProvider {
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final CounterBuilder? counterBuilder;
  final bool isUnderLineTextFormField;
  final InputDecoration? inputDeco;
  final TextStyle? errorStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final GlobalKey? fieldKey;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    this.textEditingController,
    this.validator,
    this.counterBuilder,
    this.isUnderLineTextFormField = false,
    this.inputDeco,
    this.errorStyle,
    this.textStyle,
    this.hintStyle,
    this.fieldKey,
    this.hintText,
    this.maxLength,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final defaultErrorStyle =
        textStyleTheme.body5R.copyWith(color: colorTheme.errorRed);

    final defaultHintStyle =
        textStyleTheme.body4M.copyWith(color: colorTheme.natural03);

    final defaultEnableBorderSide = BorderSide(color: colorTheme.natural02);
    final defaultFocusedBorderSide = BorderSide(color: colorTheme.primaryBlue);

    final defaultEnableErrorBorderSide = BorderSide(color: colorTheme.errorRed);
    final defaultFocusedErrorBorderSide =
        BorderSide(color: colorTheme.errorRed);

    return TextFormField(
      key: fieldKey,
      controller: textEditingController,
      onTap: () {
        if (fieldKey != null) {
          Scrollable.ensureVisible(fieldKey!.currentContext!);
        }
      },
      validator: validator,
      buildCounter: counterBuilder,
      style: textStyle,
      maxLines: maxLines,
      maxLength: maxLength,
      cursorColor: colorTheme.primaryBlue,
      decoration: inputDeco ??
          InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ?? defaultHintStyle,
            errorStyle: errorStyle ?? defaultErrorStyle,
            counterText: counterBuilder == null ? "" : null,
            enabledBorder: isUnderLineTextFormField
                ? UnderlineInputBorder(borderSide: defaultEnableBorderSide)
                : OutlineInputBorder(borderSide: defaultEnableBorderSide),
            focusedBorder: isUnderLineTextFormField
                ? UnderlineInputBorder(borderSide: defaultFocusedBorderSide)
                : OutlineInputBorder(borderSide: defaultFocusedBorderSide),
            errorBorder: isUnderLineTextFormField
                ? UnderlineInputBorder(borderSide: defaultEnableErrorBorderSide)
                : OutlineInputBorder(borderSide: defaultEnableErrorBorderSide),
            focusedErrorBorder: isUnderLineTextFormField
                ? UnderlineInputBorder(
                    borderSide: defaultFocusedErrorBorderSide)
                : OutlineInputBorder(borderSide: defaultFocusedErrorBorderSide),
          ),
    );
  }
}
