import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/model/common_response.dart';

import 'package:gamemuncheol/feature/user/model/user.dart';
import 'package:gamemuncheol/feature/user/repository/user_repository.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  StateMapper<SingleDataState<User?>> build() => StateMapper.init();

  Future<void> init() async {
    final UserRepository userRepository = ref.read(userRepositoryProvider);

    final CommonResponse<bool> isAgree = await userRepository.isAgree();
    if (isAgree.data!) {
      final CommonResponse<User> user = await userRepository.me();
      state = SingleDataState(data: user.data!);
      return;
    }

    state = SingleDataState(data: null);
  }

  Future<void> agree() async {
    final UserRepository userRepository = ref.read(userRepositoryProvider);

    state = LoadingState();
    final CommonResponse<User> user = await userRepository.agree();
    state = SingleDataState(data: user.data!);
  }
}
