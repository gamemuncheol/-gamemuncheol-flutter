import 'package:gamemuncheol/common/service/secure_storage/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/model/base_state.dart';

import 'package:gamemuncheol/feature/auth/state/auth_state.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/model/token_response.dart';
import 'package:gamemuncheol/feature/auth/repository/auth_repository.dart';

import 'package:gamemuncheol/feature/user/provider/user_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  StateMapper<AuthState> build() => StateMapper.init();

  Future<void> checkToken() async {
    final SignInMethodModel signInMethodModel =
        await ref.read(authRepositoryProvider).readLastSignInMethod();

    final String? accessToken = await ref
        .read(secureStorageProvider)
        .read(key: AppData.ACCESS_TOKEN_KEY);

    if (accessToken != null) {
      await ref.read(userNotifierProvider.notifier).init();
      state = Authenticated(signInMethod: signInMethodModel.signInMethod);
      return;
    }

    state = UnAuthenticated(signInMethod: signInMethodModel.signInMethod);
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final FlutterSecureStorage storage = ref.read(secureStorageProvider);

    await storage.write(key: AppData.ACCESS_TOKEN_KEY, value: accessToken);
    await storage.write(key: AppData.REFRESH_TOKEN_KEY, value: refreshToken);
  }

  Future<bool> signInWithOAuth({
    required TokenResponse token,
    required SignInMethod signInMethod,
  }) async {
    final String accessToken = token.accessToken;
    final String refreshToken = token.refreshToken;

    await ref.read(authRepositoryProvider).recordSignInHistory(signInMethod);
    await saveTokens(accessToken: accessToken, refreshToken: refreshToken);

    state = Authenticated(signInMethod: signInMethod);

    return true;
  }

  Future<void> signOut() async {
    await ref.read(secureStorageProvider).deleteAll();
    state = UnAuthenticated(signInMethod: state.pState.signInMethod);
  }
}
