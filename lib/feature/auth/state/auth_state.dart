import 'package:gamemuncheol/common/model/common_error.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';

sealed class AuthState {
  // 최근 로그인 플랫폼
  final SignInMethod signInMethod;

  AuthState({required this.signInMethod});
}

class AuthStateError extends AuthState {
  final ErrorWithMessage error;

  AuthStateError({
    required super.signInMethod,
    required this.error,
  });
}

class AuthStateLoading extends AuthState {
  AuthStateLoading({required super.signInMethod});
}

class Authenticated extends AuthState {
  Authenticated({required super.signInMethod});
}

class UnAuthenticated extends AuthState {
  UnAuthenticated({required super.signInMethod});
}
