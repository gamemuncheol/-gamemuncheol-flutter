import 'package:gamemuncheol/common/const/data.dart';
import 'package:gamemuncheol/common/repository/secure_storage/storage_repository.dart';
import 'package:gamemuncheol/feature/auth/model/token_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/repository/auth_dao.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  final AuthDao authDao = ref.read(authDaoProvider);
  final SecureStorageRepository secureStorageRepository =
      ref.read(secureStorageRepositoryProvider);

  return AuthService(
      authDao: authDao, secureStorageRepository: secureStorageRepository);
}

class AuthService {
  final AuthDao _authDao;
  final SecureStorageRepository _storageRepository;

  AuthService({
    required AuthDao authDao,
    required SecureStorageRepository secureStorageRepository,
  })  : _authDao = authDao,
        _storageRepository = secureStorageRepository;

  Future<String?> checkToken() async {
    return await _storageRepository.read(key: AppData.ACCESS_TOKEN_KEY);
  }

  Future<SignInMethodModel> readLastSignInMethod() async =>
      await _authDao.readLastSignInMethod();

  Future<bool> signIn({
    required TokenResponse token,
    required SignInMethod signInMethod,
  }) async {
    await _updateSignInHistory(signInMethod);
    return _saveTokens(
            accessToken: token.accessToken, refreshToken: token.refreshToken)
        .then((value) => true);
  }

  Future<void> _saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    _storageRepository.write(key: AppData.ACCESS_TOKEN_KEY, value: accessToken);
    _storageRepository.write(
        key: AppData.REFRESH_TOKEN_KEY, value: refreshToken);
  }

  Future<void> _updateSignInHistory(SignInMethod signInMethod) async {
    final signInMethodModel = SignInMethodModel()..signInMethod = signInMethod;

    _authDao.updateSignInHistory(signInMethodModel);
    return;
  }

  Future<bool> signOut() async {
    return _storageRepository.deleteAll().then((value) => true);
  }
}
