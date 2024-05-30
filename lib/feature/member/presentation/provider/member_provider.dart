import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/feature/member/model/member.dart';
import 'package:gamemuncheol/feature/member/service/member_service.dart';

part 'member_provider.g.dart';

@Riverpod(keepAlive: true)
class MemberNotifier extends _$MemberNotifier {
  @override
  StateMapper<SingleDataState<Member?>> build() => StateMapper.init();

  Future<void> init() async {
    final memberService = ref.read(memberServiceProvider);

    final CommonResponse<bool> isAgree = await memberService.isAgree();
    if (isAgree.data!) {
      final CommonResponse<Member> user = await memberService.me();
      state = SingleDataState(data: user.data!);
      return;
    }

    state = SingleDataState(
      data: null,
    );
  }

  Future<void> agree() async {
    state = LoadingState();
    final memberService = ref.read(memberServiceProvider);

    final CommonResponse<Member> user = await memberService.agree();

    state = SingleDataState(
      data: user.data!,
    );
  }
}
