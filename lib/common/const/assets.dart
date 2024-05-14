// ignore_for_file: constant_identifier_names

class AppAsset {
  // 기본 경로
  static const imagePath = "assets/images";
  static const videoPath = "assets/videos";

  // 하위 경로
  static const communicationPath = "$imagePath/communication";
  static const arrowPath = "$imagePath/arrow";

  // video
  static const authBackgroundVideo = "$videoPath/auth_background_video.mp4";

  // 롤 문철 로고
  static const lolMuncheolLogo = "assets/images/LolMunCheol.png";

  // 롤 문철 로고 장식
  static const lolMuncheolUnderlinePath =
      "assets/images/LolMuncheol_underline.svg";

  // 개인정보처리방침 빈 항목
  static const CHECKBOX_BLANK_VER_PATH = "assets/images/checkbox_blank_ver.svg";

  // 개인정보처리방침 체크한 항목
  static const CHECKBOX_FILLED_VER_PATH =
      "assets/images/checkbox_filled_ver.svg";

  // 앱바 아이콘
  static const APP_BAR_ICON_PATH = "assets/images/app_bar_icon.svg";

  // 앱바 아이콘 옆에 텍스트
  static const APP_BAR_LOGO_TEXT_PATH = "assets/images/app_bar_text.svg";

  // 검색 아이콘
  static const SEARCH_ICON_PATH = "assets/images/search_icon.svg";

  // 새 알림 아이콘
  static const NOTIFICATION_NEW_ICON_PATH =
      "assets/images/notification_new_icon.svg";

  // 기본 알림 아이콘
  static const NOTIFICATION_BASIC_ICON_PATH =
      "assets/images/notification_basic_icon.svg";

  // 전적 검색 방법 주의사항
  static const MATCH__INFO_TEXT_PATH = "assets/images/match_info_text.svg";

  // 전적 검색 방법 예시 사진
  static const MATCH__INFO_IMAGE_PATH = "assets/images/match_info_image.png";

  // 다이얼로그 종 모양 아이콘
  static const DIALOG_ICON = "assets/images/dialog_icon.png";

  // arrow
  static const chevronRightBlack = "$arrowPath/28w_chevron_right.svg";
  static const chevronLeftBlack = "$arrowPath/28b_chevron_left.svg";
  static const chevronLeftWhite = "$arrowPath/28w_chevron_left.svg";
  static const closeWhite = "$arrowPath/28w_close.svg";
  static const closeBlack = "$arrowPath/28b_close.svg";

  // communication
  static const appleLogo = "$communicationPath/apple.svg"; // 애플 로고
  static const googleLogo = "$communicationPath/google.svg"; // 구글 로고

  static const title = "$communicationPath/title.svg"; // 제목 아이콘
  static const contents = "$communicationPath/contents.svg"; // 본문 아이콘

  static const cameraOn = "$communicationPath/camera_on.svg"; // 카메라 아이콘
  static const cameraOff = "$communicationPath/camera_off.svg"; // 카메라 아이콘

  static const galleryOn = "$communicationPath/gallery_on.svg"; // 갤러리 아이콘
  static const galleryOff = "$communicationPath/gallery_off.svg"; // 갤러리 아이콘

  static const youtubeOn = "$communicationPath/youtube_on.svg"; // 유튜브 아이콘
  static const youtubeOff = "$communicationPath/youtube_off.svg"; // 유튜브 아이콘
}
