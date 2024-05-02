import 'package:flutter/material.dart';

mixin FormValidator {
  // bool emailValidator(String? value) {
  //   final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  //   return emailRegex.hasMatch(value ?? "");
  // }

  bool lengthValidator(String? value, {required int min}) {
    return value!.length >= min ? true : false;
  }

  void submitForm(
    GlobalKey<FormState> formKey, {
    required void Function() whenValid,
  }) {
    final bool isValidForm = formKey.currentState!.validate();

    if (isValidForm) {
      whenValid();
    }
  }
}
