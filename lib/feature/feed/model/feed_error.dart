// ignore_for_file: constant_identifier_names

import 'package:gamemuncheol/common/model/base_error.dart';

enum FeedError implements CustomError {
  // 동영상 업로드 용량 초과
  BYTE_OVER_FLOW("최대 업로드 용량은 500MB입니다."),

  // 동영상 선택 취소
  VIDEO_NOT_SELECTED("선택된 동영상이 없습니다."),

  // 썸네일 자동 추출 실패
  THUMB_IMAGE_INITIALIZE_FAILED(""),

  // 동영상 선택 취소
  THUMB_IMAGE_NOT_SELECTED("선택된 사진이 없습니다."),

  // 지원하지 않는 파일 양식
  UNSUPPORTED_FILE("지원하지 않는 파일 양식입니다."),

  // 전적 검색 결과 없음
  NO_SUCH_MATCH("검색 결과가 존재하지 않습니다."),

  // 유튜브 URL 검색 결과 없음
  NO_SUCH_YOUTUBE_URL("존재하지 않는 유튜브 url입니다.");

  const FeedError(this.message);

  @override
  final String message;
}

// class ByteOverFlow implements BaseError {
//   @override
//   final String message = "최대 업로드 용량은 500MB입니다.";
// }

// class VideoNotSelected implements BaseError {
//   @override
//   final String message = "선택된 동영상이 없습니다.";
// }

// class ThumbImageInitializeFailed implements BaseError {
//   @override
//   final String message = "";
// }

// class ThumbImageNotSelected implements BaseError {
//   @override
//   final String message = "선택된 사진이 없습니다.";
// }

// class UnSupportedFile implements BaseError {
//   @override
//   final String message = "지원하지 않는 파일 형식입니다.";
// }

// class NoSuchMatch implements BaseError {
//   @override
//   final String message = "검색 결과가 존재하지 않습니다.";
// }

// class NoSuchYoutubeUrl implements BaseError {
//   @override
//   final String message = "존재하지 않는 유튜브 url입니다.";
// }
