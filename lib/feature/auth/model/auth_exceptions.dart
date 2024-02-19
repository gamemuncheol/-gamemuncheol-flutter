// 로그인 중단
class SignInProccesInterruptionException implements Exception {
  final String message = "";
}

// 최초 회원가입이 아니거나, 익명 로그인 시
class AppleSignInFailed implements Exception {
  final String message = "회원가입에 실패했습니다. 최초 회원 가입이 아니거나 이름을 제공하지 않았습니다.";

  AppleSignInFailed({
    String? message,
  });
}
