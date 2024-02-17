import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';

class AuthStateBase {
  final SignInMethod signInMethod;

  AuthStateBase({
    required this.signInMethod,
  });
}

class AuthStateException extends AuthStateBase {
  final Exception exception;

  AuthStateException({
    required super.signInMethod,
    required this.exception,
  });
}

class AuthStateLoading extends AuthStateBase {
  AuthStateLoading({
    required super.signInMethod,
  });
}

class AuthStateAuthenticated extends AuthStateBase {
  AuthStateAuthenticated({
    required super.signInMethod,
  });
}

class AuthStateUnAuthenticated extends AuthStateBase {
  AuthStateUnAuthenticated({
    required super.signInMethod,
  });
}
