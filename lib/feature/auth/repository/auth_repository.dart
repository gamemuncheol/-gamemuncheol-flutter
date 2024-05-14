// ignore_for_file: unused_field

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/repository/auth_dao.dart';
import 'package:gamemuncheol/feature/auth/repository/auth_api.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final AuthApi authApi = ref.read(authApiProvider);
  final AuthDao authDao = ref.read(authDaoProvider);

  return AuthRepositoryImpl(authApi: authApi, authDao: authDao);
}

abstract class AuthRepository {
  Future<SignInMethodModel> readLastSignInMethod();
  Future<void> recordSignInHistory(SignInMethod signInMethod);
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
  Future<void> recordSignInHistory(SignInMethod signInMethod) async {
    final SignInMethodModel signInMethodModel = SignInMethodModel()
      ..signInMethod = signInMethod;

    await _authDao.recordSignInHistory(signInMethodModel);
  }

  @override
  Future<SignInMethodModel> readLastSignInMethod() async =>
      _authDao.readLastSignInMethod();
}
