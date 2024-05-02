import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/user/model/user.dart';
import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/feature/user/repository/user_repository.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  BaseState<User?> build() => BaseState.init();

  Future<void> init() async {
    final UserRepository userRepository = ref.read(userRepositoryProvider);
    state = Loading();

    final CommonResponse<bool> isAgree = await userRepository.isAgree();
    if (isAgree.data!) {
      final CommonResponse<User> user = await userRepository.me();
      state = Data(user.data!);
      return;
    }

    state = Data(null);
  }

  Future<void> agree() async {
    final UserRepository userRepository = ref.read(userRepositoryProvider);
    state = Loading();

    final CommonResponse<User> user = await userRepository.agree();
    state = Data(user.data!);
  }
}
