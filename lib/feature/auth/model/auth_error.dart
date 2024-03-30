import 'package:gamemuncheol/common/model/common_error.dart';

// 로그인 중단
class SignInProccesInterruptionException implements ErrorWithMessage {
  @override
  final String message = "";
}

// 익명 로그인
class AppleSignInFailed implements ErrorWithMessage {
  @override
  final String message = "죄송합니다. 익명 로그인은 지원하지 않습니다.";
}
