// ignore_for_file: constant_identifier_names

abstract class CustomError implements Exception {
  final String message;
  CustomError(this.message);
}

enum CommonError implements CustomError {
  // 이유를 알 수 없을 때
  UN_KNOWN("존재하지 않는 유튜브 url입니다.");

  const CommonError(this.message);

  @override
  final String message;
}
