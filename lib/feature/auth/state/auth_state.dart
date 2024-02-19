// ignore_for_file: slash_for_doc_comments

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';

class AuthStateBase {
  // 최근 로그인 플랫폼
  final SignInMethod signInMethod;

  AuthStateBase({
    required this.signInMethod,
  });
}

// 예외 상태
class AuthStateException extends AuthStateBase {
  /** 
   * 발생 가능한 예외
   * common/model, auth/model에 정의돼 있음
   */
  final Exception exception;

  AuthStateException({
    required super.signInMethod,
    required this.exception,
  });
}

// 로딩 상태
class AuthStateLoading extends AuthStateBase {
  AuthStateLoading({
    required super.signInMethod,
  });
}

// 로그인 + 닉네임 등록 상태
class AuthStateAuthenticatedWithNickName extends AuthStateBase {
  AuthStateAuthenticatedWithNickName({
    required super.signInMethod,
  });
}

// 로그인 상태
class AuthStateAuthenticated extends AuthStateBase {
  AuthStateAuthenticated({
    required super.signInMethod,
  });
}

// 로그아웃 상태
class AuthStateUnAuthenticated extends AuthStateBase {
  AuthStateUnAuthenticated({
    required super.signInMethod,
  });
}
