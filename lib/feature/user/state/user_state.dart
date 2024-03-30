import 'package:gamemuncheol/feature/user/model/user.dart';

abstract class UserState {
  final User? user;
  UserState(this.user);
}
