import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/feature/auth/presentation/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/presentation/state/auth_state.dart';
import 'package:gamemuncheol/feature/member/model/member.dart';
import 'package:gamemuncheol/feature/member/presentation/provider/member_provider.dart';

part 'role_method.g.dart';

@riverpod
void excecuteWhen(
  ExcecuteWhenRef ref, {
  required Function user,
  required Function guest,
}) {
  final bool authenticated = ref.read(authNotifierProvider) is Authenticated;

  if (authenticated) {
    final StateMapper<SingleDataState<Member?>> bState =
        ref.read(memberNotifierProvider);

    // 개인정보처리방침 동의 유저
    if (bState.pState.data != null) {
      user();
      return;
    }
  }
  // 개인정보처리방침 미동의 유저
  guest();
}
