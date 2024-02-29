// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'apple_sign_in_request_body.g.dart';

@JsonSerializable()
class AppleSignInRequestBody {
  // 애플 계정 이름
  final String name;

  // 애플에서 인가 받은 토큰
  final String identityToken;

  AppleSignInRequestBody({
    required this.name,
    required this.identityToken,
  });

  factory AppleSignInRequestBody.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AppleSignInRequestBodyFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$AppleSignInRequestBodyToJson(
        this,
      );
}
