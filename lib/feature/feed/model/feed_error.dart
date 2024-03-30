// 최대 크기 초과
import 'package:gamemuncheol/common/model/common_error.dart';

class ByteOverFlow implements ErrorWithMessage {
  @override
  final String message = "동영상이 500MB를 초과하였습니다.";

  ByteOverFlow({
    String? message,
  });
}

// 동영상 선택 취소
class FileNotSelected implements ErrorWithMessage {
  @override
  final String message = "선택된 동영상이 없습니다.";
}
