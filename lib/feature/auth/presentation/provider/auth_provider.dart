import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/repository/secure_storage/secure_storage.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/model/token_response.dart';
import 'package:gamemuncheol/feature/auth/presentation/state/auth_state.dart';
import 'package:gamemuncheol/feature/auth/service/auth_service.dart';
import 'package:gamemuncheol/feature/member/presentation/provider/member_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  StateMapper<AuthState> build() => StateMapper.init();

  Future<void> init() async {
    final SignInMethodModel signInMethodModel =
        await ref.read(authServiceProvider).readLastSignInMethod();

    if (await ref.read(authServiceProvider).checkToken() != null) {
      await ref.read(memberNotifierProvider.notifier).init();
      state = Authenticated(signInMethod: signInMethodModel.signInMethod);
      return;
    }

    state = UnAuthenticated(signInMethod: signInMethodModel.signInMethod);
  }

  Future<bool> signIn({
    required TokenResponse token,
    required SignInMethod signInMethod,
  }) async {
    await ref
        .read(authServiceProvider)
        .signIn(token: token, signInMethod: signInMethod);

    state = Authenticated(signInMethod: signInMethod);
    return true;
  }

  Future<void> signOut() async {
    await ref.read(secureStorageProvider).deleteAll();
    state = UnAuthenticated(signInMethod: state.pState.signInMethod);
  }
}
