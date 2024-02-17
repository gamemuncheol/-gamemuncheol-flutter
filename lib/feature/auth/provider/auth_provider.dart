import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_response.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/auth/model/apple_sign_in_request_body.dart';
import 'package:gamemuncheol/feature/auth/repository/auth_repository.dart';
import 'package:gamemuncheol/feature/auth/view/OauthWebviewScreen.dart';
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

  void selectPlatform({
    required SignInMethod signInMethod,
  }) {
    // 로그인 플랫폼 임시 저장
    state = AuthStateUnAuthenticated(
      signInMethod: signInMethod,
    );
  }

  Future<AppleSignInRequestBody?> _signInWithAppleClient() async {
    // 클라이언트에서 인가
    final Result<AppleSignInRequestBody> appleSignInRequestBody = await ref
        .read(
          authRepositoryProvider,
        )
        .signInWithAppleClient();

    // 반환 및 상태 변경
    return appleSignInRequestBody.when(
      success: (appleSignInRequestBody) => appleSignInRequestBody,
      failure: (exc) {
        state = AuthStateException(
          exception: exc,
          signInMethod: state.signInMethod,
        );

        return null;
      },
    );
  }

  Future<void> signInWithApple() async {
    // 로딩
    state = AuthStateLoading(
      signInMethod: state.signInMethod,
    );

    // 클라이언트에서 인가
    final AppleSignInRequestBody? appleSignInRequestBody =
        await _signInWithAppleClient();
    
    // 예외 발생 시 더이상 수행하지 않음
    if (appleSignInRequestBody == null) {
      return;
    }

    // 서버에 토큰 전송
    final Result<SignInResponse> resp = await ref
        .read(
          authRepositoryProvider,
        )
        .signInWithApple(
          appleSignInRequestBody: appleSignInRequestBody,
        );

    // 상태 변경
    resp.when(
      success: (data) => state = AuthStateAuthenticated(
        signInMethod: state.signInMethod,
      ),
      failure: (exc) => state = AuthStateException(
        signInMethod: state.signInMethod,
        exception: exc,
      ),
    );
  }

  void signInWithGoogle(BuildContext context) => context.go(
        "${OauthWebviewScreen.PATH}?platform=google",
      );
}
