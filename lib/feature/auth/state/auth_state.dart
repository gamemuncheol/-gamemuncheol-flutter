import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';

class AuthStateBase {
  // 최근 로그인 플랫폼
  final SignInMethod signInMethod;

  AuthStateBase({
    required this.signInMethod,
  });
}

// 에러 상태
class AuthStateError extends AuthStateBase {
  // 발생 가능한 에러
  final Exception error;

  AuthStateError({
    required super.signInMethod,
    required this.error,
  });
}

// 로딩 상태
class AuthStateLoading extends AuthStateBase {
  AuthStateLoading({
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
