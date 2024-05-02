import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/user/provider/user_provider.dart';
import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/secure_storage/secure_storage.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/auth/model/apple_sign_in_request_body.dart';
import 'package:gamemuncheol/feature/auth/repository/auth_repository.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/state/auth_state.dart';
import 'package:gamemuncheol/feature/auth/model/token_response.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => UnAuthenticated(signInMethod: SignInMethod.none);

  // 토큰 체크
  Future<void> checkToken() async {
    final SignInMethodModel signInMethodModel =
        await ref.read(authRepositoryProvider).readLastSignInMethod();

    final String? accessToken =
        await ref.read(secureStorageProvider).read(key: Data.ACCESS_TOKEN_KEY);

    if (accessToken != null) {
      await ref.read(userNotifierProvider.notifier).init();
      state = Authenticated(signInMethod: signInMethodModel.signInMethod);
      return;
    }

    state = UnAuthenticated(signInMethod: signInMethodModel.signInMethod);
  }

  // 토큰 저장
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await ref
        .read(secureStorageProvider)
        .write(key: Data.ACCESS_TOKEN_KEY, value: accessToken);

    await ref
        .read(secureStorageProvider)
        .write(key: Data.REFRESH_TOKEN_KEY, value: refreshToken);
  }

  // 클라이언트 애플 로그인
  Future<AppleSignInRequestBody?> _signInWithAppleClient() async {
    state = AuthStateLoading(signInMethod: state.signInMethod);

    final Result<AppleSignInRequestBody> appleSignInRequestBody =
        await ref.read(authRepositoryProvider).signInWithAppleClient();

    return appleSignInRequestBody.when(
      success: (appleSignInRequestBody) {
        return appleSignInRequestBody;
      },
      failure: (error) {
        state = AuthStateError(error: error, signInMethod: state.signInMethod);
        return null;
      },
    );
  }

  // OAuth 애플 로그인
  Future<bool> signInWithApple() async {
    final AppleSignInRequestBody? appleSignInRequestBody =
        await _signInWithAppleClient();

    if (appleSignInRequestBody == null) {
      return false;
    }

    final Result<CommonResponse<TokenResponse>> resp = await ref
        .read(authRepositoryProvider)
        .signInWithApple(appleSignInRequestBody: appleSignInRequestBody);

    resp.when(
      success: (tokenResponse) async {
        await ref
            .read(authRepositoryProvider)
            .createSignInHistory(SignInMethod.apple);

        final String accessToken = tokenResponse.data!.accessToken;
        final String refreshToken = tokenResponse.data!.refreshToken;

        await saveTokens(accessToken: accessToken, refreshToken: refreshToken);
        state = Authenticated(signInMethod: state.signInMethod);
      },
      failure: (error) {
        state = AuthStateError(signInMethod: state.signInMethod, error: error);
      },
    );

    return true;
  }
  
  // OAuth 구글 로그인
  Future<bool> signInWithGoogle({required String token}) async {
    final String accessToken = token.split("/").first;
    final String refreshToken = token.split("/").last;

    await ref
        .read(authRepositoryProvider)
        .createSignInHistory(SignInMethod.google);

    await saveTokens(accessToken: accessToken, refreshToken: refreshToken);
    state = Authenticated(signInMethod: state.signInMethod);

    return true;
  }

  Future<void> signOut() async {
    await ref.read(secureStorageProvider).deleteAll();
    state = UnAuthenticated(signInMethod: state.signInMethod);
  }
}
