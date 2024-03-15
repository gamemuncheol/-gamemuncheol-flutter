import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/secure_storage/secure_storage.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_response.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/auth/model/apple_sign_in_request_body.dart';
import 'package:gamemuncheol/feature/auth/repository/auth_repository.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/state/auth_state.dart';

part 'auth_provider.g.dart';

@Riverpod(
  keepAlive: true,
)
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthStateBase build() => AuthStateUnAuthenticated(
        signInMethod: SignInMethod.NONE,
      );

  Future<void> saveTokens({
    required SignInResponse signInResponse,
  }) async {
    final SignInResponseData data = signInResponse.data!;

    await ref
        .read(secureStorageProvider)
        .write(key: Data.ACCESS_TOKEN_KEY, value: data.accessToken);

    await ref
        .read(secureStorageProvider)
        .write(key: Data.REFRESH_TOKEN_KEY, value: data.refreshToken);
  }

  Future<AppleSignInRequestBody?> _signInWithAppleClient() async {
    final Result<AppleSignInRequestBody> appleSignInRequestBody =
        await ref.read(authRepositoryProvider).signInWithAppleClient();

    switch (appleSignInRequestBody) {
      case Success<AppleSignInRequestBody>():
        return appleSignInRequestBody.data;

      case Failure():
        state = AuthStateError(
          error: appleSignInRequestBody.exc,
          signInMethod: state.signInMethod,
        );
        return null;
    }
  }

  Future<void> signInWithApple() async {
    final AppleSignInRequestBody? appleSignInRequestBody =
        await _signInWithAppleClient();

    state = AuthStateLoading(
      signInMethod: state.signInMethod,
    );

    if (appleSignInRequestBody == null) {
      return;
    }

    final Result<SignInResponse> signInResponse = await ref
        .read(authRepositoryProvider)
        .signInWithApple(appleSignInRequestBody: appleSignInRequestBody);

    switch (signInResponse) {
      case Success<SignInResponse>():
        await saveTokens(
          signInResponse: signInResponse.data,
        );

        state = AuthStateAuthenticated(
          signInMethod: state.signInMethod,
        );

        break;

      case Failure():
        state = AuthStateError(
          signInMethod: state.signInMethod,
          error: signInResponse.exc,
        );

        break;
    }
  }

  Future<void> signInWithGoogle({
    required String token,
  }) async {}
}
