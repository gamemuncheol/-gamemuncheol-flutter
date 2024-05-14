import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/feature/user/repository/user_repository.dart';

part 'change_nickname_provider.g.dart';

@riverpod
class ChangeNickNameNotifier extends _$ChangeNickNameNotifier {
  @override
  StateMapper<SingleDataState<CommonResponse>> build() => StateMapper.init();

  Future<void> changeNickName(String nickname) async {
    state = LoadingState(message: "닉네임 변경 중..");
    final Result<CommonResponse> resp =
        await ref.read(userRepositoryProvider).changeNickname(nickname);

    resp.when(
      success: (response) => state = SingleDataState(data: response),
      failure: (error) => state = ErrorState(error),
    );
  }
}
