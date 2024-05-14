import 'package:gamemuncheol/common/model/base_error.dart';

class ByteOverFlow implements BaseError {
  @override
  final String message = "최대 업로드 용량은 500MB입니다.";
}

class VideoNotSelected implements BaseError {
  @override
  final String message = "선택된 동영상이 없습니다.";
}

class ThumbImageInitializeFailed implements BaseError {
  @override
  final String message = "";
}

class ThumbImageNotSelected implements BaseError {
  @override
  final String message = "선택된 사진이 없습니다.";
}

class UnSupportedFile implements BaseError {
  @override
  final String message = "지원하지 않는 파일 형식입니다.";
}

class NoSuchMatch implements BaseError {
  @override
  final String message = "검색 결과가 존재하지 않습니다.";
}

class NoSuchYoutubeUrl implements BaseError {
  @override
  final String message = "존재하지 않는 유튜브 url입니다.";
}
