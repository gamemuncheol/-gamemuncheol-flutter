import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/user/model/user.dart';
import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/feature/user/repository/user_repository.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  Future<User?> build() async {
    final UserRepository userRepository = ref.read(userRepositoryProvider);
    final CommonResponse<bool> isAgree = await userRepository.isAgree();

    if (isAgree.data!) {
      final CommonResponse<User> user = await userRepository.me();
      return user.data!;
    }

    return null;
  }

  Future<void> agree() async {
    state = const AsyncValue.loading();
    final UserRepository userRepository = ref.read(userRepositoryProvider);

    final CommonResponse<User> user = await userRepository.agree();
    state = AsyncValue.data(user.data!);
  }
}
