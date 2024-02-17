class SignInProccesInterruptionException implements Exception {
  final String message = "";
}

class AppleSignInFailed implements Exception {
  final String message = "회원가입에 실패했습니다. 최초 회원 가입이 아니거나 이름을 제공하지 않았습니다.";
}
