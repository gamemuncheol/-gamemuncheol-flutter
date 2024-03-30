import 'package:isar/isar.dart';

part 'sign_in_method.g.dart';

enum SignInMethod {
  none,
  apple,
  google,
}

@collection
class SignInMethodModel {
  Id id = Isar.autoIncrement;

  @enumerated
  late SignInMethod signInMethod;
}
