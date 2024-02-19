import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/secure_storage/secure_storage.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_response.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/auth/model/apple_sign_in_request_body.dart';
import 'package:gamemuncheol/feature/auth/repository/auth_repository.dart';
import 'package:gamemuncheol/feature/auth/view/oauth_webview_screen.dart';
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

  // 로그인 플랫폼 선택
  void selectPlatform({
    required SignInMethod signInMethod,
  }) {
    state = AuthStateUnAuthenticated(
      signInMethod: signInMethod,
    );
  }

  // 토큰 저장
  Future<void> saveTokens({
    required SignInResponse signInResponse,
  }) async {
    await ref
        .read(
          secureStorageProvider,
        )
        .write(
          key: ACCESS_TOKEN_KEY,
          value: signInResponse.data!.accessToken,
        );

    await ref
        .read(
          secureStorageProvider,
        )
        .write(
          key: REFRESH_TOKEN_KEY,
          value: signInResponse.data!.refreshToken,
        );
  }

  // 클라이언트 단의 애플 로그인
  Future<AppleSignInRequestBody?> _signInWithAppleClient() async {
    // 로딩
    state = AuthStateLoading(
      signInMethod: state.signInMethod,
    );

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

  // 서버 단의 애플 로그인(토큰 받아서 백엔드에 전송)
  Future<void> signInWithApple() async {
    // 클라이언트에서 인가
    final AppleSignInRequestBody? appleSignInRequestBody =
        await _signInWithAppleClient();

    // 예외 발생 시 더이상 수행하지 않음
    if (appleSignInRequestBody == null) {
      return;
    }

    // 서버에 토큰 전송
    final Result<SignInResponse> signInResponse = await ref
        .read(
          authRepositoryProvider,
        )
        .signInWithApple(
          appleSignInRequestBody: appleSignInRequestBody,
        );

    // 토큰 저장 및 상태 변경
    signInResponse.when(
      success: (signInResponse) async {
        await saveTokens(
          signInResponse: signInResponse,
        );

        state = AuthStateAuthenticated(
          signInMethod: state.signInMethod,
        );
      },
      failure: (exc) => state = AuthStateException(
        signInMethod: state.signInMethod,
        exception: exc,
      ),
    );
  }

  // 클라이언트 단의 구글 로그인(OAuth 웹뷰로 이동)
  void signInWithGoogleClient(BuildContext context) => context.go(
        OauthWebviewScreen.PATH,
        extra: SignInMethod.GOOGLE,
      );

  // 서버 단의 구글 로그인(토큰 받아서 백엔드에 전송)
  Future<void> signInWithGoogle({
    required String token,
  }) async {}
}
