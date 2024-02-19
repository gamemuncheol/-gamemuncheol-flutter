// ignore_for_file: constant_identifier_names

enum RedirectState {
  // 앱 첫 진입 시점
  SPLASH,

  // 로그아웃
  UNAUTHENTICATED,

  // 로그인
  AUTHENTICATED,

  // 로그인 + 닉네임 등록
  AUTHENTICATED_WITH_NICKNAME,
}
