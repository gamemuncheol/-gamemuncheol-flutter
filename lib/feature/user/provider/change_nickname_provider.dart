import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/common/model/data_state.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/user/repository/user_repository.dart';

part 'change_nickname_provider.g.dart';

@riverpod
class ChangeNicknamNotifier extends _$ChangeNicknamNotifier {
  @override
  BaseState<CommonResponse> build() => BaseState();

  Future<void> changeNickname(String nickname) async {
    state = Loading(loadingText: "닉네임 변경 중..");
    final Result<CommonResponse> resp =
        await ref.read(userRepositoryProvider).changeNickname(nickname);

    resp.when(
      success: (response) => state = Data(response),
      failure: (error) => state = Error(error),
    );
  }
}
