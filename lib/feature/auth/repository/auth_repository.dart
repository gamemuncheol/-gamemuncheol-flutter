import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:gamemuncheol/common/model/common_exception.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/auth/model/apple_sign_in_request_body.dart';
import 'package:gamemuncheol/feature/auth/model/auth_exceptions.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_response.dart';
import 'package:gamemuncheol/feature/auth/repository/auth_api.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final AuthApi authApi = ref.read(
    authApiProvider,
  );

  return AuthRepositoryImpl(
    authApi: authApi,
  );
}

abstract class AuthRepository {
  // 클라이언트 단의 애플 로그인
  Future<Result<AppleSignInRequestBody>> signInWithAppleClient();

  // 서버 단의 애플 로그인
  Future<Result<SignInResponse>> signInWithApple({
    required AppleSignInRequestBody appleSignInRequestBody,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImpl({
    required this.authApi,
  });

  @override
  Future<Result<AppleSignInRequestBody>> signInWithAppleClient() async {
    AuthorizationCredentialAppleID? credential;

    try {
      credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      print("1. 클라이언트에서 인가 성공 $credential");

// credential.givenName ?? "가나" + credential.familyName! ?? "다라"
      return Success(
        data: AppleSignInRequestBody(
          name: "dsdsa",
          identityToken: credential.identityToken!,
        ),
      );
    } catch (e) {
      if (credential == null) {
        return Failure(
          exc: SignInProccesInterruptionException(),
        );
      }

      return Failure(
        exc: UnKnownException(),
      );
    }
  }

  @override
  Future<Result<SignInResponse>> signInWithApple({
    required AppleSignInRequestBody appleSignInRequestBody,
  }) async {
    try {
      final SignInResponse signInResponse = await authApi.signInWithApple(
        appleSignInRequestBody: appleSignInRequestBody,
      );

      print(
        "2. 서버에 토큰 전송 성공 \n accessToken: ${signInResponse.data!.accessToken} \n refreshToken: ${signInResponse.data!.refreshToken}",
      );

      if (signInResponse.status.statusCode != 200) {
        return Failure(
          exc: AppleSignInFailed(
            message: signInResponse.status.message,
          ),
        );
      }

      return Success(
        data: signInResponse,
      );
    } catch (e) {
      return Failure(
        exc: UnKnownException(),
      );
    }
  }
}
