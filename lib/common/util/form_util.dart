import 'package:flutter/material.dart';

mixin FormValidator {
  bool lengthValidator(String? value, {required int min}) {
    return value!.length >= min ? true : false;
  }

  void submitForm(
    GlobalKey<FormState> formKey, {
    required void Function() whenValid,
    bool? forceInvalid,
  }) {
    final bool isValidForm = formKey.currentState!.validate();

    if (isValidForm) {
      whenValid();
    }
  }
}
