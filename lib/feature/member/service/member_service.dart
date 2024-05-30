import 'package:gamemuncheol/common/model/base_error.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/feature/member/model/member.dart';
import 'package:gamemuncheol/feature/member/repository/member_api.dart';

part 'member_service.g.dart';

@riverpod
MemberService memberService(MemberServiceRef ref) {
  final MemberApi memberApi = ref.read(memberApiProvider);
  return MemberService(memberApi: memberApi);
}

class MemberService {
  final MemberApi _memberApi;
  MemberService({required MemberApi memberApi}) : _memberApi = memberApi;

  Future<Result<CommonResponse>> changeNickname(String nickname) async {
    try {
      final CommonResponse resp = await _memberApi.changeNickname(nickname);
      if (resp.success) {
        return Success(resp);
      }
    } catch (e) {
      return const Failure(
        CommonError.UN_KNOWN,
      );
    }

    return const Failure(
      CommonError.UN_KNOWN,
    );
  }

  Future<CommonResponse<bool>> isAgree() async {
    final CommonResponse<bool> isAgree = await _memberApi.isAgree();
    return isAgree;
  }

  Future<CommonResponse<Member>> agree() async {
    final CommonResponse<Member> user = await _memberApi.agree();
    return user;
  }

  Future<CommonResponse<Member>> me() async {
    final CommonResponse<Member> user = await _memberApi.me();
    return user;
  }
}
