// 로그인 중단
class SignInProccesInterruptionException implements Exception {
  final String message = "";
}

// 익명 로그인 시
class AppleSignInFailed implements Exception {
  final String message = "죄송합니다. 익명 로그인은 지원하지 않습니다.";

  AppleSignInFailed({
    String? message,
  });
}
