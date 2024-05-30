import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';

part 'isar.g.dart';

@riverpod
Isar isar(IsarRef ref) => throw UnimplementedError();

class IsarSource {
  IsarSource._();

  static Future<Isar> getIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [
        SignInMethodModelSchema,
      ],
      directory: dir.path,
      inspector: true,
    );
  }
}
