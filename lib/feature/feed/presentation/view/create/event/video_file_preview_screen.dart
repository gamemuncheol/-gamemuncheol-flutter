import 'package:gamemuncheol/common/di/locator.dart';
import 'package:go_router/go_router.dart';

mixin VideoFilePreviewScreenEvent {
  void pop() {
    locator.navKey.context.pop();
  }
}
