import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/state/auth_state.dart';
import 'package:gamemuncheol/feature/user/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/user/provider/user_provider.dart';

part 'role_method.g.dart';

@riverpod
void excecuteWhen(
  ExcecuteWhenRef ref, {
  required Function user,
  required Function guest,
}) {
  final bool authenticated = ref.read(authNotifierProvider) is Authenticated;

  if (authenticated) {
    final BaseState<User?> userState = ref.read(userNotifierProvider);
    if (userState.valueOrNull != null) {
      debugPrint("개인정보처리방침 동의 유저");
      user();
      return;
    }
  }
  debugPrint("개인정보처리방침 미동의 유저");
  guest();
}
