import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gamemuncheol/common/repository/secure_storage/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_repository.g.dart';

@riverpod
SecureStorageRepository secureStorageRepository(
    SecureStorageRepositoryRef ref) {
  final FlutterSecureStorage secureStorage = ref.read(secureStorageProvider);

  return SecureStorageRepositoryImpl(
    secureStorage: secureStorage,
  );
}

// 나중에 스토리지 바꿔도 다른 서비스에 영향 x
abstract class SecureStorageRepository {
  Future<String?> read({required String key});
  Future<void> write({required String key, required String value});
  Future<void> deleteAll();
}

class SecureStorageRepositoryImpl implements SecureStorageRepository {
  final FlutterSecureStorage _secureStorage;

  SecureStorageRepositoryImpl({
    required FlutterSecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  @override
  Future<void> deleteAll() async {
    _secureStorage.deleteAll();
  }

  @override
  Future<String?> read({required String key}) {
    return _secureStorage.read(key: key);
  }

  @override
  Future<void> write({required String key, required String value}) async {
    _secureStorage.write(key: key, value: value);
  }
}
