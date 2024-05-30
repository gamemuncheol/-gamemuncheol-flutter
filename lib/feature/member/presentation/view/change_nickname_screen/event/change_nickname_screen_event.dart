import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/member/presentation/provider/change_nickname_provider.dart';
import 'package:gamemuncheol/feature/member/presentation/view/change_nickname_screen/change_nickname_screen.dart';

mixin ChangeNicknameScreenEvent on BaseScreenV2State<ChangeNicknameScreen> {
  // 닉네임 컨트롤러
  final nicknameController = TextEditingController();

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  // 리딩 이벤트
  // pushReplace로 왔기 때문에 pop하면 홈 화면으로 감
  void onLeadingTap() {
    context.pop();
  }

  // pushReplace로 왔기 때문에
  // 닉네임 변경 후 pop하면 홈 화면으로 감
  Future<void> changeNickName() async {
    await ref
        .read(changeNickNameNotifierProvider.notifier)
        .changeNickName(nicknameController.text.trim())
        .whenComplete(context.pop);
  }
}
