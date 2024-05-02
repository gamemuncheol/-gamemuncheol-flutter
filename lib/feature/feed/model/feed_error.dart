import 'package:gamemuncheol/common/model/common_error.dart';

// 최대 크기 초과
class ByteOverFlow implements ErrorWithMessage {
  @override
  final String message = "동영상이 500MB를 초과하였습니다.";

  ByteOverFlow({
    String? message,
  });
}

// 동영상 선택 취소
class VideoNotSelected implements ErrorWithMessage {
  @override
  final String message = "선택된 동영상이 없습니다.";
}

// 썸네일 자동 초기화 실패
class ThumbNailInitializeFailed implements ErrorWithMessage {
  @override
  final String message = "";
}

// 썸네일 선택 취소
class ThumbNailNotSelected implements ErrorWithMessage {
  @override
  final String message = "선택된 동영상이 없습니다.";
}

// 검색 결과 없음
class NoSuchMatchHistory implements ErrorWithMessage {
  @override
  final String message = "검색 결과가 존재하지 않습니다.";
}

// 검색 결과 없음
class NoSuchYoutubeUrl implements ErrorWithMessage {
  @override
  final String message = "존재하지 않는 유튜브 url입니다.";
}
