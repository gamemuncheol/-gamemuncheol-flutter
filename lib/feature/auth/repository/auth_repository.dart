import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/feature/auth/model/token_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/repository/auth_dao.dart';
import 'package:gamemuncheol/common/model/common_error.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/auth/model/apple_sign_in_request_body.dart';
import 'package:gamemuncheol/feature/auth/model/auth_error.dart';
import 'package:gamemuncheol/feature/auth/repository/auth_api.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final AuthApi authApi = ref.read(authApiProvider);
  final AuthDao authDao = ref.read(authDaoProvider);

  return AuthRepositoryImpl(
    authApi: authApi,
    authDao: authDao,
  );
}

abstract class AuthRepository {
  // 클라이언트 단의 애플 로그인
  Future<Result<AppleSignInRequestBody>> signInWithAppleClient();

  // 서버 단의 애플 로그인
  Future<Result<CommonResponse<TokenResponse>>> signInWithApple({
    required AppleSignInRequestBody appleSignInRequestBody,
  });

  // 최근 로그인 플랫폼 확인
  Future<SignInMethodModel> readLastSignInMethod();

  // 최근 로그인 플랫폼 저장
  Future<void> createSignInHistory(SignInMethod signInMethod);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  final AuthDao _authDao;

  AuthRepositoryImpl({
    required AuthApi authApi,
    required AuthDao authDao,
  })  : _authApi = authApi,
        _authDao = authDao;

  @override
  Future<Result<AppleSignInRequestBody>> signInWithAppleClient() async {
    AuthorizationCredentialAppleID? credential;

    try {
      credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: Data.NOUNCE,
      );

      // 나중에 이름 미제공 시 실패로 틀어야 함!

      return Success(
        AppleSignInRequestBody(
          name: "dddddd",
          identityToken: credential.identityToken!,
        ),
      );
    } catch (e) {
      if (credential == null) {
        return Failure(SignInProccesInterruptionException());
      }

      return Failure(UnKnown());
    }
  }

  @override
  Future<Result<CommonResponse<TokenResponse>>> signInWithApple({
    required AppleSignInRequestBody appleSignInRequestBody,
  }) async {
    try {
      final CommonResponse<TokenResponse> tokenResp =
          await _authApi.signInWithApple(appleSignInRequestBody);

      if (tokenResp.status.statusCode != 200) {
        return Failure(AppleSignInFailed());
      }

      return Success(tokenResp);
    } catch (e) {
      return Failure(UnKnown());
    }
  }

  @override
  Future<void> createSignInHistory(SignInMethod signInMethod) async {
    final SignInMethodModel signInMethodModel = SignInMethodModel()
      ..signInMethod = signInMethod;

    await _authDao.createSignInHistory(signInMethodModel);
  }

  @override
  Future<SignInMethodModel> readLastSignInMethod() async =>
      _authDao.readLastSignInMethod();
}
