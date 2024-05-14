import 'package:gamemuncheol/common/model/base_state.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';

mixin AuthState on StateMapper<AuthState> {
  SignInMethod get signInMethod;

  @override
  AuthState get pState => this;
}

class Authenticated extends StateMapper<AuthState> with AuthState {
  @override
  final SignInMethod signInMethod;

  Authenticated({required this.signInMethod});
}

class UnAuthenticated extends StateMapper<AuthState> with AuthState {
  @override
  final SignInMethod signInMethod;

  UnAuthenticated({required this.signInMethod});
}
