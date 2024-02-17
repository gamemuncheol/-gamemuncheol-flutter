import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  // 성공 여부
  final bool success;

  // 상세 상태
  final SignInResponseStatus status;

  // 데이터
  final SignInResponseData? data;

  SignInResponse({
    required this.success,
    required this.status,
    this.data,
  });

  factory SignInResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SignInResponseFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$SignInResponseToJson(
        this,
      );
}

@JsonSerializable()
class SignInResponseStatus {
  final int statusCode;
  final String message;

  SignInResponseStatus({
    required this.statusCode,
    required this.message,
  });

  factory SignInResponseStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SignInResponseStatusFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$SignInResponseStatusToJson(
        this,
      );
}

@JsonSerializable()
class SignInResponseData {
  final String accessToken;
  final String refreshToken;

  SignInResponseData({
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignInResponseData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SignInResponseDataFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$SignInResponseDataToJson(
        this,
      );
}
