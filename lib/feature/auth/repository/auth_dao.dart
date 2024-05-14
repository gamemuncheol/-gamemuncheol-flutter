import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar/isar.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/common/isar/isar.dart';

part 'auth_dao.g.dart';

@riverpod
AuthDao authDao(AuthDaoRef ref) {
  final Isar isar = ref.read(isarProvider);
  return AuthDaoImpl(isar: isar);
}

abstract class AuthDao {
  Future<SignInMethodModel> readLastSignInMethod();
  Future<void> recordSignInHistory(SignInMethodModel signInMethodDataModel);
}

class AuthDaoImpl implements AuthDao {
  final Isar _isar;

  AuthDaoImpl({
    required Isar isar,
  }) : _isar = isar;

  @override
  Future<SignInMethodModel> readLastSignInMethod() async {
    SignInMethodModel? signInMethodModel =
        await _isar.signInMethodModels.get(1);

    final SignInMethodModel defaultValue = SignInMethodModel()
      ..signInMethod = SignInMethod.none;

    return signInMethodModel ?? defaultValue;
  }

  @override
  Future<void> recordSignInHistory(
    SignInMethodModel signInMethodDataModel,
  ) async {
    await _isar.writeTxn(() async {
      await _deleteAllSignInHistory();
      await _isar.signInMethodModels.put(signInMethodDataModel);
    });
  }

  Future<void> _deleteAllSignInHistory() async {
    await _isar.signInMethodModels.clear();
  }
}
